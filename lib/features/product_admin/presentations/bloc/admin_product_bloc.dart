import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_admin/common/navigator/navigator.dart';
import 'package:web_admin/entities/models/add_product_model.dart';
import 'package:web_admin/entities/models/update_product_model.dart';
import 'package:web_admin/entities/models/category_model.dart';
import 'package:web_admin/entities/models/product_model.dart';
import 'package:web_admin/features/product_admin/data/admin_product_impl.dart';
import 'package:web_admin/features/product_admin/domain/usecase/ImagePickerUseCase.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

part 'admin_product_event.dart';
part 'admin_product_state.dart';
part 'admin_product_bloc.freezed.dart';

class AdminProductBloc extends Bloc<AdminProductEvent, AdminProductState> {
  final AdminProductRepositoryImpl repository;
  final ImagePickerUseCase imagePickerUseCase;
  final AppNavigator appNavigator;

  AdminProductBloc({
    required this.appNavigator,
    required this.repository,
    required this.imagePickerUseCase,
  }) : super(const _AdminProductState()) {
    on(_onInitial);
    on(_onSearchProduct);
    on(_onSelectCategory);
    on(_onPickerImage);
    on(_onAddNewProduct);
    on(_onDeleteProduct);
    on(_onUpdateProduct);
    add(const ProductInitialEvent());
  }
}

extension AdminProductBlocExtension on AdminProductBloc {
  Future<void> _onInitial(
      ProductInitialEvent event, Emitter<AdminProductState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    final caregories = await repository.getCategories();
    final products = await repository.getProducts();
    final idCate = caregories.first.id;
    emitter(
      state.copyWith(
        isLoading: false,
        categories: caregories,
        products: products,
        idCate: idCate,
      ),
    );
  }

  Future<void> _onSearchProduct(
      OnTapSearchProductEvent event, Emitter<AdminProductState> emitter) async {
    final products = await repository.searchProduct(event.textSearch);
    emitter(state.copyWith(products: products));
  }

  Future<void> _onSelectCategory(
      AdOnSelectCategoryEvent event, Emitter<AdminProductState> emitter) async {
    emitter(
      state.copyWith(idCate: event.cateID),
    );
  }

  Future<void> _onPickerImage(
      AdImagePickerEventEvent event, Emitter<AdminProductState> emitter) async {
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

  Future<void> _onAddNewProduct(
      AdAddNewProductEvent event, Emitter<AdminProductState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    await repository.addNewProduct(event.addProductModel);
    emitter(state.copyWith(
      isLoading: false,
      imageFile: null,
    ));
    appNavigator.pop();
    add(const ProductInitialEvent());
  }

  Future<void> _onDeleteProduct(
      AdDeleteProductEvent event, Emitter<AdminProductState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    await repository.deleteProduct(event.idProduct);
    emitter(state.copyWith(
      isLoading: false,
    ));
    add(const ProductInitialEvent());
  }

  Future<void> _onUpdateProduct(
      AdUpdateProductEvent event, Emitter<AdminProductState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    await repository.updateProduct(event.product);
    emitter(state.copyWith(isLoading: false, imageFile: null, idCate: null));
    appNavigator.pop();
    add(const ProductInitialEvent());
  }
}
