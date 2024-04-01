import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_admin/features/order_admin/presentations/binding/order_binding.dart';
import 'package:web_admin/features/order_admin/presentations/widgets/order_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProvider(
      create: OrderBinding.generateBloc,
      child: OrderWidget(),
    );
  }
}
