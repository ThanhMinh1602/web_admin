part of 'admin_category_bloc.dart';

@freezed
class AdminCategoryEvent with _$AdminCategoryEvent {
  const factory AdminCategoryEvent.initialEvent() = AdCategoryInitialEvent;
  const factory AdminCategoryEvent.adImagePickerEvent() = AdImagePickerEvent;
  const factory AdminCategoryEvent.adAddNewCategoryEvent(
      CategoryModel addCategoryModel) = AdAddNewCategoryEvent;
  const factory AdminCategoryEvent.adCategoryDeleteEvent(String idCate) =
      AdDeleteCategoryEvent;
  const factory AdminCategoryEvent.adCategoryUpdateEvent(
      CategoryModel updateCategoryModel) = AdUpdateCategoryEvent;
}
