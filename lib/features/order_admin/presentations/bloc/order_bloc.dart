import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_admin/entities/models/payment_model.dart';
import 'package:web_admin/features/order_admin/data/order_repository_impl.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepositoryImpl repository;
  OrderBloc({required this.repository}) : super(const _OrderState()) {
    on(_onInitial);
    on(_onCancelOrder);
    add(const OrderInitialEvent());
  }
}

extension OrderBlocExtension on OrderBloc {
  Future<void> _onInitial(
      OrderInitialEvent event, Emitter<OrderState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    final payments = await repository.getAllOrder();
    emitter(state.copyWith(isLoading: false, payments: payments));
  }

  Future<void> _onCancelOrder(
      OnTapCancelOrderEvent event, Emitter<OrderState> emitter) async {
    emitter(state.copyWith(isLoading: true));
    await repository.cancelOrder(event.paymentId);
    emitter(state.copyWith(isLoading: false));
    add(const OrderInitialEvent());
  }
}
