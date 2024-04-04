import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_manager_event.dart';
part 'staff_manager_state.dart';
part 'staff_manager_bloc.freezed.dart';

class StaffManagerBloc extends Bloc<StaffManagerEvent, StaffManagerState> {
  StaffManagerBloc() : super(_StaffManagerState()) {
    on<StaffManagerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
