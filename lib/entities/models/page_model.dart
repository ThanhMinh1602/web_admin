import 'package:web_admin/features/category_admin/presentations/page/admin_category_page.dart';
import 'package:web_admin/features/home_admin/presentations/page/home_page.dart';
import 'package:web_admin/features/order_admin/presentations/page/order_page.dart';
import 'package:web_admin/features/product_admin/presentations/page/admin_product_page.dart';

class PageModel {
  final String title;
  final dynamic page;

  PageModel({required this.title, required this.page});
}

List<PageModel> pages = [
  PageModel(title: 'Home Page', page: const HomePage()),
  PageModel(title: 'Products', page: const AdminAddProductPage()),
  PageModel(title: 'Categories', page: const AdminCategoryPage()),
  PageModel(title: 'Orders', page: const OrderPage()),
];
