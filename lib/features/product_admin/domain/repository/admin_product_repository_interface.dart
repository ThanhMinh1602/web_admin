import 'package:web_admin/entities/models/add_product_model.dart';
import 'package:web_admin/entities/models/update_product_model.dart';
import 'package:web_admin/entities/models/category_model.dart';
import 'package:web_admin/entities/models/product_model.dart';

abstract class IAdminProductRepository {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts();
  Future<void> addNewProduct(AddProductModel product);
  Future<void> deleteProduct(String id);
  Future<void> updateProduct(UpdateProductModel product);
  Future<List<ProductModel>> searchProduct(String searchText);
}
