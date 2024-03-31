import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_admin/features/login_admin/presentations/binding/admin_login_binding.dart';
import 'package:web_admin/features/login_admin/presentations/widgets/admin_login_widget.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProvider(
      create: AdminLoginBinding.generateBloc,
      child: AdminLoginWidget(),
    );
  }
}
