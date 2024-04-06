import 'package:flutter/material.dart';
import 'package:web_admin/common/extensions/build_context_extension.dart';
import 'package:web_admin/features/product_admin/domain/usecase/ImagePickerUseCase.dart';
import 'package:web_admin/features/staff_manager/data/staff_manager_impl.dart';
import 'package:web_admin/features/staff_manager/presentations/bloc/staff_manager_bloc.dart';

class StaffManagerBinding {
  static StaffManagerBloc generateBloc(BuildContext context) {
    return StaffManagerBloc(
      repository: StaffManagerImpl(),
      imagePickerUseCase: ImagePickerUseCase(),
      appNavigator: context.getNavigator(),
    );
  }
}
