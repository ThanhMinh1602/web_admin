import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_admin/features/home_admin/data/home_repository_impl.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepositoryImpl repository;
  HomeBloc({required this.repository}) : super(const _HomeState()) {
    on(_initial);
    add(const HomeInitialEvent());
  }
}

extension HomeBlocExtension on HomeBloc {
  Future<void> _initial(
      HomeInitialEvent event, Emitter<HomeState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    final totalSale = await repository.totalSale();
    final totalUser = await repository.totalUser();
    final totalProduct = await repository.totalProduct();
    final totalOrder = await repository.totalOrder();
    emitter(state.copyWith(
        isLoading: false,
        totalSale: totalSale,
        totalOrder: totalOrder,
        totalProduct: totalProduct,
        totalUser: totalUser));
  }
}
