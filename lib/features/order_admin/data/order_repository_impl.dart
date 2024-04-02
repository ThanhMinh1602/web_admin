import 'package:web_admin/entities/models/payment_model.dart';
import 'package:web_admin/features/order_admin/domain/repository/order_repositoy_interface.dart';
import 'package:web_admin/services/remote/payment_service.dart';

class OrderRepositoryImpl implements IOrderRepository {
  final OrderService orderService = OrderService();

  @override
  Future<List<PaymentModel>> getAllOrder() async {
    return await orderService.getPayment();
  }
}
