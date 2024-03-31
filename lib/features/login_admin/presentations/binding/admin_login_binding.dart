import 'package:flutter/widgets.dart';
import 'package:web_admin/common/extensions/build_context_extension.dart';
import 'package:web_admin/features/login_admin/data/admin_login_repositpry_impl.dart';
import 'package:web_admin/features/login_admin/presentations/bloc/admin_login_bloc.dart';

class AdminLoginBinding {
  static AdminLoginBloc generateBloc(BuildContext context) {
    return AdminLoginBloc(
      repository: AdminLoginRepositoryImpl(),
      appNavigator: context.getNavigator(),
    );
  }
}
