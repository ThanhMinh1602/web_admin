import 'dart:html' as html;

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_admin/common/navigator/navigator.dart';
import 'package:web_admin/entities/models/responses/category_model.dart';
import 'package:web_admin/features/category_admin/data/admin_cate_repository_impl.dart';
import 'package:web_admin/features/product_admin/domain/usecase/ImagePickerUseCase.dart';

part 'admin_category_event.dart';
part 'admin_category_state.dart';
part 'admin_category_bloc.freezed.dart';

class AdminCategoryBloc extends Bloc<AdminCategoryEvent, AdminCategoryState> {
  final ImagePickerUseCase imagePickerUseCase;
  final AdCategoryRepositoryImpl repository;
  final AppNavigator appNavigator;

  AdminCategoryBloc({
    required this.appNavigator,
    required this.imagePickerUseCase,
    required this.repository,
  }) : super(const _AdminCategoryState()) {
    on(_onInitial);
    on(_onPickImage);
    on(_onSubmitCategory);
    on(_onDeleteCategory);
    on(_onUpdateCategory);
    add(const AdCategoryInitialEvent());
  }
}

extension AdminCategoryBlocExtension on AdminCategoryBloc {
  Future<void> _onInitial(
      AdCategoryInitialEvent event, Emitter<AdminCategoryState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    final categories = await repository.getAllCategory();
    emitter(state.copyWith(isLoading: false, categories: categories));
  }

  Future<void> _onPickImage(
      AdImagePickerEvent event, Emitter<AdminCategoryState> emitter) async {
    final html.File? dataImage = await imagePickerUseCase();
    if (dataImage != null) {
      final render = html.FileReader();
      render.readAsArrayBuffer(dataImage);
      await render.onLoad.first;
      final imageUnit8List = Uint8List.fromList(render.result as List<int>);
      emitter(
          state.copyWith(imageFile: dataImage, imageUnit8List: imageUnit8List));
    }
  }

  Future<void> _onSubmitCategory(
      AdAddNewCategoryEvent event, Emitter<AdminCategoryState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    await repository.addNewCategory(event.addCategoryModel);
    emitter(state.copyWith(isLoading: false, imageFile: null));
    appNavigator.pop();
    add(const AdCategoryInitialEvent());
  }

  Future<void> _onDeleteCategory(
      AdDeleteCategoryEvent event, Emitter<AdminCategoryState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    await repository.deleteCategory(event.idCate);
    emitter(state.copyWith(isLoading: false));
    add(const AdCategoryInitialEvent());
  }

  Future<void> _onUpdateCategory(
      AdUpdateCategoryEvent event, Emitter<AdminCategoryState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    await repository.updateCategory(event.updateCategoryModel);
    emitter(state.copyWith(isLoading: false));
    appNavigator.pop();
    add(const AdCategoryInitialEvent());
  }
}
