import 'package:web_admin/entities/models/user_model.dart';
import 'package:web_admin/services/sevice_status.dart';

abstract class IStaffManagerRepository {
  Future<List<UserModel>> getStaff();
  Future<SignupResult> addStaff(UserModel userModel);
  Future<void> updateStaff(UserModel userModel, String oldPassword);
  Future<void> deleteStaff(UserModel userModel);
}
