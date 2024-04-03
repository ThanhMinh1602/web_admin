part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(0) double totalSale,
    @Default(0) int totalUser,
    @Default(0) int totalProduct,
    @Default(0) int totalOrder,
  }) = _HomeState;
}
