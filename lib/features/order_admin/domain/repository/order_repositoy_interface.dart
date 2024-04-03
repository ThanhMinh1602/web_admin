import 'package:web_admin/entities/models/payment_model.dart';

abstract class IOrderRepository {
  Future<List<PaymentModel>> getAllOrder();
  Future<void> cancelOrder(String paymentId);
}
