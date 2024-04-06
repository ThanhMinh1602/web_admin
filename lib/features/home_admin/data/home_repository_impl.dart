import 'package:web_admin/features/home_admin/domain/repository/home_repository_interface.dart';
import 'package:web_admin/services/remote/auth_service.dart';
import 'package:web_admin/services/remote/order_service.dart';
import 'package:web_admin/services/remote/product_service.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final OrderService orderService = OrderService();
  final ProductService productService = ProductService();
  final AuthService authService = AuthService();
  @override
  Future<double> totalSale() async {
    double totalSale = 0;
    final dataPayment = await orderService.getPayment();
    for (int i = 0; i < dataPayment.length; i++) {
      double a = dataPayment[i].totalPrice ?? 0.0;
      totalSale += a;
    }
    return totalSale;
  }

  @override
  Future<int> totalOrder() async {
    final totalOrder = await orderService.getPayment();
    return totalOrder.length;
  }

  @override
  Future<int> totalProduct() async {
    final totalProduct = await productService.fetchAllProductsByCreateAt();
    return totalProduct.length;
  }

  @override
  Future<int> totalUser() async {
    final totalUser = await authService.getCustomer();
    return totalUser.length;
  }
}
