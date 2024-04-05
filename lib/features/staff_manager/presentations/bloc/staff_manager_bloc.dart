// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_admin/entities/models/user_model.dart';

part 'staff_manager_event.dart';
part 'staff_manager_state.dart';
part 'staff_manager_bloc.freezed.dart';

class StaffManagerBloc extends Bloc<StaffManagerEvent, StaffManagerState> {
  StaffManagerBloc() : super(const _StaffManagerState()) {
    on<StaffManagerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
