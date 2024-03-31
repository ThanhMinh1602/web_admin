import 'package:web_admin/entities/models/requests/add_product_model.dart';
import 'package:web_admin/entities/models/responses/category_model.dart';
import 'package:web_admin/entities/models/responses/product_model.dart';

abstract class IAdminProductRepository {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts();
  Future<void> addNewProduct(AddProductModel product);
  Future<void> deleteProduct(String id);
  Future<void> updateProduct(AddProductModel product);
}
