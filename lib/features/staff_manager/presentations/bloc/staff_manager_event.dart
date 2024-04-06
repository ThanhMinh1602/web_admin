part of 'staff_manager_bloc.dart';

@freezed
class StaffManagerEvent with _$StaffManagerEvent {
  const factory StaffManagerEvent.initalEvent() = StaffManagerInitialEvent;
  const factory StaffManagerEvent.imagePickerEvent() =
      StaffManagerImagePickerEvent;
  const factory StaffManagerEvent.addStaffEvent(UserModel userModel) =
      StaffManagerAddStaffEvent;
  const factory StaffManagerEvent.deleteStaffEvent(UserModel userModel) =
      StaffManagerDeleteStaffEvent;
  const factory StaffManagerEvent.updateStaffEvent(
      UserModel userModel, String oldPassword) = StaffManagerUpdateStaffEvent;
}
