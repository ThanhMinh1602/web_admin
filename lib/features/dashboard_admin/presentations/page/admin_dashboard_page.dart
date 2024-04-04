import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_admin/features/dashboard_admin/presentations/binding/admin_dashboard_binding.dart';
import 'package:web_admin/features/dashboard_admin/presentations/widgets/admin_dashboard_widget.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key, required this.isAdmin});
  final bool isAdmin;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: AdminDashBoardBinding.generateBloc,
      child: AdminDashboardWidget(
        isAdmin: isAdmin,
      ),
    );
  }
}
