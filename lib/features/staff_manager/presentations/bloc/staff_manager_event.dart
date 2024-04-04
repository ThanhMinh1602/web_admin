part of 'staff_manager_bloc.dart';

@freezed
class StaffManagerEvent with _$StaffManagerEvent {
  const factory StaffManagerEvent.initalEvent() = StaffManagerInitialEvent;
}