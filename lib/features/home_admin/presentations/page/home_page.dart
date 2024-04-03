import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_admin/features/home_admin/presentations/binding/home_binding.dart';
import 'package:web_admin/features/home_admin/presentations/widgets/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProvider(
      create: HomeBinding.generateBloc,
      child: HomeWidget(),
    );
  }
}
