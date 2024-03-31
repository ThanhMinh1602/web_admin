import 'package:bloc/bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_admin/common/navigator/navigator.dart';
import 'package:web_admin/entities/models/requests/login_request.dart';
import 'package:web_admin/features/login_admin/data/admin_login_repositpry_impl.dart';
import 'package:web_admin/services/sevice_status.dart';
part 'admin_login_event.dart';
part 'admin_login_state.dart';
part 'admin_login_bloc.freezed.dart';

class AdminLoginBloc extends Bloc<AdminLoginEvent, AdminLoginState> {
  final AdminLoginRepositoryImpl repository;
  final AppNavigator appNavigator;
  AdminLoginBloc({
    required this.repository,
    required this.appNavigator,
  }) : super(const _AdminLoginState()) {
    on(_onInitialAdminLogin);
    on(_onAdminLogin);
  }
}

extension ExtensionAdminLoginBloc on AdminLoginBloc {
  Future<void> _onInitialAdminLogin(
      AdminLoginInitialEvent event, Emitter<AdminLoginState> emitter) async {}
  Future<void> _onAdminLogin(
      AdminLoginEvents event, Emitter<AdminLoginState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    final result = await repository.adminLogin(event.loginRequest);
    if (result == SigninResult.successIsAdmin) {
      appNavigator.pushAndRemoveUntil(
          screen: const ScreenType.adminDashBoard());
      EasyLoading.showSuccess('Sign in success');
    } else {
      EasyLoading.showError('Email or password is incorrect');
    }
  }
}
