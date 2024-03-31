import 'package:web_admin/entities/models/requests/login_request.dart';
import 'package:web_admin/features/login_admin/domain/repository/admin_login_repositpry_interface.dart';
import 'package:web_admin/services/remote/auth_service.dart';
import 'package:web_admin/services/sevice_status.dart';

class AdminLoginRepositoryImpl implements IAdminLoginReposiry {
  final AuthService adminAuthService = AuthService();
  @override
  Future<SigninResult> adminLogin(LoginRequest loginRequest) async {
    return await adminAuthService.signInWithEmail(loginRequest);
  }
}
