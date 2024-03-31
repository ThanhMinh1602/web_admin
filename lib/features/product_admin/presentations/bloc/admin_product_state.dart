part of 'admin_product_bloc.dart';

@freezed
class AdminProductState with _$AdminProductState {
  const factory AdminProductState({
    @Default(false) bool isLoading,
    @Default([]) List<CategoryModel> categories,
    @Default([]) List<ProductModel> products,
    String? idCate,
    Uint8List? imageUnit8List,
    html.File? imageFile,
  }) = _AdminProductState;
}
