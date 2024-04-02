part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    @Default(false) isLoading,
    @Default([]) List<PaymentModel> payments,
  }) = _OrderState;
}
