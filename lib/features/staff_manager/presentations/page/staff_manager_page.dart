import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_admin/features/staff_manager/presentations/binding/staff_manager_binding.dart';
import 'package:web_admin/features/staff_manager/presentations/widgets/staff_manager_widget.dart';

class StaffManagerPage extends StatelessWidget {
  const StaffManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProvider(
      create: StaffManagerBinding.generateBloc,
      child: StaffManagerWidget(),
    );
  }
}
