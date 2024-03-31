import 'package:flutter/cupertino.dart';
import 'package:web_admin/common/extensions/build_context_extension.dart';
import 'package:web_admin/features/category_admin/data/admin_cate_repository_impl.dart';
import 'package:web_admin/features/category_admin/presentations/bloc/admin_category_bloc.dart';
import 'package:web_admin/features/product_admin/domain/usecase/ImagePickerUseCase.dart';

class AdminCategoryBinding {
  static AdminCategoryBloc generateBloc(BuildContext context) {
    return AdminCategoryBloc(
      appNavigator: context.getNavigator(),
      imagePickerUseCase: ImagePickerUseCase(),
      repository: AdCategoryRepositoryImpl(),
    );
  }
}
