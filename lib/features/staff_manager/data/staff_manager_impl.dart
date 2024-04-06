import 'package:web_admin/entities/models/user_model.dart';
import 'package:web_admin/features/staff_manager/domain/repository/staff_manager_interface.dart';
import 'package:web_admin/services/remote/auth_service.dart';
import 'package:web_admin/services/sevice_status.dart';

class StaffManagerImpl implements IStaffManagerRepository {
  final AuthService authService = AuthService();
  @override
  Future<SignupResult> addStaff(UserModel userModel) async {
    return await authService.createStaff(userModel);
  }

  @override
  Future<void> deleteStaff(UserModel userModel) async {
    await authService.deleteStaff(userModel);
  }

  @override
  Future<List<UserModel>> getStaff() async {
    final staff = await authService.getStaff();
    return staff;
  }

  @override
  Future<void> updateStaff(UserModel userModel, String oldPassword) async {
    await authService.updateStaff(userModel, oldPassword);
  }
}
