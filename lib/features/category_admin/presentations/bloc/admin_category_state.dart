part of 'admin_category_bloc.dart';

@freezed
class AdminCategoryState with _$AdminCategoryState {
  const factory AdminCategoryState({
    @Default(false) bool isLoading,
    @Default([]) List<CategoryModel> categories,
    CategoryModel? categoryModel,
    Uint8List? imageUnit8List,
    html.File? imageFile,
  }) = _AdminCategoryState;
}
