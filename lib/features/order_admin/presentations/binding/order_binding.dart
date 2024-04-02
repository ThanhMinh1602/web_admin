import 'package:flutter/material.dart';
import 'package:web_admin/features/order_admin/data/order_repository_impl.dart';
import 'package:web_admin/features/order_admin/presentations/bloc/order_bloc.dart';

class OrderBinding {
  static OrderBloc generateBloc(BuildContext context) {
    return OrderBloc(
      repository: OrderRepositoryImpl(),
    );
  }
}
