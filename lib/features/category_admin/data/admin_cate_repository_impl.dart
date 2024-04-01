import 'package:web_admin/entities/models/category_model.dart';
import 'package:web_admin/features/category_admin/domain/repository/admin_cate_repository_interface.dart';
import 'package:web_admin/services/remote/category_service.dart';

class AdCategoryRepositoryImpl implements IAdCategoryRepository {
  final CategoryService categoryService = CategoryService();
  @override
  Future<void> addNewCategory(CategoryModel category) async {
    await categoryService.addNewCategory(category);
  }

  @override
  Future<List<CategoryModel>> getAllCategory() async {
    return await categoryService.fetchCategories();
  }

  @override
  Future<void> deleteAllCategory() {
    // TODO: implement deleteAllCategory
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCategory(String id) async {
    await categoryService.deleteCategory(id);
  }

  @override
  Future<void> updateCategory(CategoryModel category) async {
    await categoryService.updateCategory(category);
  }
}
