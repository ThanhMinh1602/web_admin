import 'package:flutter/material.dart';
import 'package:web_admin/features/staff_manager/presentations/bloc/staff_manager_bloc.dart';

class StaffManagerBinding {
  static StaffManagerBloc generateBloc(BuildContext context) {
    return StaffManagerBloc();
  }
}
