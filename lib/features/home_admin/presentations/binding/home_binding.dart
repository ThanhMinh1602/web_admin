import 'package:flutter/material.dart';
import 'package:web_admin/features/home_admin/data/home_repository_impl.dart';
import 'package:web_admin/features/home_admin/presentations/bloc/home_bloc.dart';

class HomeBinding {
  static HomeBloc generateBloc(BuildContext buildContext) {
    return HomeBloc(
      repository: HomeRepositoryImpl(),
    );
  }
}
