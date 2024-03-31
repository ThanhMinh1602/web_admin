import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_admin/features/category_admin/presentations/binding/admin_category_binding.dart';
import 'package:web_admin/features/category_admin/presentations/widgets/admin_category_widget.dart';

class AdminCategoryPage extends StatelessWidget {
  const AdminCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: AdminCategoryBinding.generateBloc,
      child: AdminCategoryWidget(),
    );
  }
}
