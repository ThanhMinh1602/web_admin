import 'package:web_admin/entities/models/login_request.dart';
import 'package:web_admin/services/sevice_status.dart';

abstract class IAdminLoginReposiry {
  Future<SigninResult> adminLogin(LoginRequest loginRequest);
}
