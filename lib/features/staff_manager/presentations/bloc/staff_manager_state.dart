part of 'staff_manager_bloc.dart';

@freezed
class StaffManagerState with _$StaffManagerState {
  const factory StaffManagerState({
    @Default(false) bool isLoading,
    @Default([]) List<UserModel> staff,
    UserModel? userModel,
    Uint8List? imageUnit8List,
    html.File? imageFile,
  }) = _StaffManagerState;
}
