import 'package:flutter/cupertino.dart';
import 'package:web_admin/common/extensions/build_context_extension.dart';
import 'package:web_admin/features/product_admin/data/admin_product_impl.dart';
import 'package:web_admin/features/product_admin/domain/usecase/ImagePickerUseCase.dart';
import 'package:web_admin/features/product_admin/presentations/bloc/admin_product_bloc.dart';

class AdminProductBinding {
  static AdminProductBloc generateBloc(BuildContext context) {
    return AdminProductBloc(
      repository: AdminProductRepositoryImpl(),
      imagePickerUseCase: ImagePickerUseCase(),
      appNavigator: context.getNavigator(),
    );
  }
}
