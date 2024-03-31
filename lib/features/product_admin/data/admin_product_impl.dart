import 'package:web_admin/entities/models/product/add_product_model.dart';
import 'package:web_admin/entities/models/responses/category_model.dart';
import 'package:web_admin/entities/models/product/product_model.dart';
import 'package:web_admin/features/product_admin/domain/repository/admin_product_repository_interface.dart';
import 'package:web_admin/services/remote/category_service.dart';
import 'package:web_admin/services/remote/product_service.dart';

class AdminProductRepositoryImpl implements IAdminProductRepository {
  final CategoryService categoryService = CategoryService();
  final ProductService productService = ProductService();
  @override
  Future<List<CategoryModel>> getCategories() async {
    return categoryService.fetchCategories();
  }

  @override
  Future<void> addNewProduct(AddProductModel product) async {
    await productService.addNewProduct(product);
  }

  @override
  Future<void> deleteProduct(String id) async {
    await productService.deleteProductById(id);
  }

  @override
  Future<void> updateProduct(AddProductModel product) async {
    await productService.updateProduct(product);
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    return await productService.fetchAllProductsByCreateAt();
  }
}
