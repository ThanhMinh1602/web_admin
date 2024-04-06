// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_admin/common/navigator/navigator.dart';
import 'package:web_admin/entities/models/user_model.dart';
import 'package:web_admin/features/product_admin/domain/usecase/ImagePickerUseCase.dart';
import 'package:web_admin/features/staff_manager/data/staff_manager_impl.dart';
import 'package:web_admin/services/sevice_status.dart';

part 'staff_manager_event.dart';
part 'staff_manager_state.dart';
part 'staff_manager_bloc.freezed.dart';

class StaffManagerBloc extends Bloc<StaffManagerEvent, StaffManagerState> {
  final StaffManagerImpl repository;
  final ImagePickerUseCase imagePickerUseCase;
  final AppNavigator appNavigator;
  StaffManagerBloc(
      {required this.repository,
      required this.imagePickerUseCase,
      required this.appNavigator})
      : super(const _StaffManagerState()) {
    on(_initial);
    on(_onPickerImage);
    on(_onAddStaff);
    on(_onUpdateStaff);
    on(_onDeleteStaff);
    add(const StaffManagerInitialEvent());
  }
}

extension StaffManagerBlocExtension on StaffManagerBloc {
  Future<void> _initial(StaffManagerInitialEvent event,
      Emitter<StaffManagerState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    final staffs = await repository.getStaff();
    emitter(state.copyWith(isLoading: false, staff: staffs));
  }

  Future<void> _onPickerImage(StaffManagerImagePickerEvent event,
      Emitter<StaffManagerState> emitter) async {
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

  Future<void> _onAddStaff(StaffManagerAddStaffEvent event,
      Emitter<StaffManagerState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    final addStaff = await repository.addStaff(event.userModel);
    if (addStaff == SignupResult.emailAlreadyExists) {
      emitter(state.copyWith(
        isLoading: false,
      ));
      EasyLoading.showError('Email already exists');
      return;
    }

    final staffs = await repository.getStaff();
    emitter(state.copyWith(isLoading: false, staff: staffs, imageFile: null));
    EasyLoading.showSuccess('Add staff success');
    appNavigator.pop();
  }

  Future<void> _onUpdateStaff(StaffManagerUpdateStaffEvent event,
      Emitter<StaffManagerState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    await repository.updateStaff(event.userModel, event.oldPassword);
    final staffs = await repository.getStaff();
    emitter(state.copyWith(isLoading: false, staff: staffs, imageFile: null));
    EasyLoading.showSuccess('Update staff success');
    appNavigator.pop();
  }

  Future<void> _onDeleteStaff(StaffManagerDeleteStaffEvent event,
      Emitter<StaffManagerState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    await repository.deleteStaff(event.userModel);
    final staffs = await repository.getStaff();
    emitter(state.copyWith(
      isLoading: false,
      staff: staffs,
    ));
    EasyLoading.showSuccess('Delete staff success');
  }
}
