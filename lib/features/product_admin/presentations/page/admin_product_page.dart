import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_admin/features/product_admin/presentations/binding/admin_product_binding.dart';
import 'package:web_admin/features/product_admin/presentations/widgets/admin_product_widget.dart';

class AdminAddProductPage extends StatelessWidget {
  const AdminAddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: AdminProductBinding.generateBloc,
      child: AdminProductWidget(),
    );
  }
}
