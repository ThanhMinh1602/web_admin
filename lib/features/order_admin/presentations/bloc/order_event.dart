part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.initialEvent() = OrderInitialEvent;
  const factory OrderEvent.onCancelOrder(String paymentId) = OnTapCancelOrderEvent;
}