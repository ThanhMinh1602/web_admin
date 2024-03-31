part of 'admin_product_bloc.dart';

@freezed
class AdminProductEvent with _$AdminProductEvent {
  const factory AdminProductEvent.productInitialEvent() = ProductInitialEvent;
  const factory AdminProductEvent.adImagePickerEventEvent() =
      AdImagePickerEventEvent;
  const factory AdminProductEvent.adAddNewProductEvent(
      AddProductModel addProductModel) = AdAddNewProductEvent;
  const factory AdminProductEvent.adOnSelectCategoryEvent(
      String cateID) = AdOnSelectCategoryEvent;

  const factory AdminProductEvent.adProductDeleteEvent(String idProduct) =
      AdDeleteProductEvent;
  const factory AdminProductEvent.adProductUpdateEvent(
      AddProductModel product) = AdUpdateProductEvent;
}
