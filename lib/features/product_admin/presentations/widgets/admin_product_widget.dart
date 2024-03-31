import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_admin/common/components/buttons/app_button.dart';
import 'package:web_admin/common/components/dialog/app_dialog.dart';
import 'package:web_admin/common/components/textfields/app_text_field.dart';
import 'package:web_admin/common/constants/app_color.dart';
import 'package:web_admin/common/constants/app_style.dart';
import 'package:web_admin/common/extensions/build_context_extension.dart';
import 'package:web_admin/entities/models/requests/add_product_model.dart';
import 'package:web_admin/entities/models/responses/category_model.dart';
import 'package:web_admin/entities/models/responses/product_model.dart';
import 'package:web_admin/features/product_admin/presentations/bloc/admin_product_bloc.dart';
import 'package:web_admin/services/utils/validator.dart';

// ignore: must_be_immutable
class AdminProductWidget extends StatelessWidget {
  AdminProductWidget({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController minSizeController = TextEditingController();
  final TextEditingController maxSizeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminProductBloc, AdminProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(20.0.h),
          margin: EdgeInsets.all(20.0.h),
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductButtonAdd(context),
              const SizedBox(height: 30.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.greyColor),
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.products.length,
                    separatorBuilder: (_, __) => const Divider(
                      indent: 0,
                      endIndent: 0,
                    ),
                    itemBuilder: (context, index) {
                      return _buildProductListItem(
                          context, state.products[index], index);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  AppButton _buildProductButtonAdd(BuildContext context) {
    return AppButton(
      buttonText: 'Add product',
      boderRadius: 5.0,
      minimumSize: Size(100.w, 50.0.h),
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => _buildFormAddProduct(context),
        );
        nameController.clear();
        priceController.clear();
        quantityController.clear();
        minSizeController.clear();
        maxSizeController.clear();
        descriptionController.clear();
      },
    );
  }

  Widget _buildProductListItem(
      BuildContext context, ProductModel product, int index) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => _buildFormEditProduct(context, product: product),
        );
      },
      child: ListTile(
        leading: Text('${index + 1}', style: AppStyle.regular12),
        title: Row(
          children: [
            Image.network(
              product.image,
              width: 100.0.w,
            ),
            SizedBox(width: 50.0.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product name: ${product.name}',
                    style: AppStyle.regular14
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0.h),
                  Text(
                    'Price: ${product.price} đ',
                    style: AppStyle.regular12,
                  ),
                  Text(
                    'Sales: ${product.orderCount}',
                    style: AppStyle.regular12,
                  ),
                  Text(
                    'Quantity: ${product.quantity}',
                    style: AppStyle.regular12,
                  ),
                ],
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete_outline,
            color: AppColor.redColor,
          ),
          onPressed: () => _showDeleteProductDialog(context, product),
        ),
      ),
    );
  }

  void _showDeleteProductDialog(
      BuildContext context, ProductModel productModel) {
    AppDiaLog.showAwesomeConfirmDialog(
      context,
      content: 'Do you want to delete this product?',
      btnOkOnPress: () {
        context.getBloc<AdminProductBloc>().add(
              AdDeleteProductEvent(productModel.id),
            );
      },
    );
  }

  Widget _buildFormAddProduct(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AdminProductBloc>(context),
      child: BlocBuilder<AdminProductBloc, AdminProductState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.7,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () => context.getNavigator().pop(),
                        icon: const Icon(Icons.close),
                      ),
                    ),
                    Text('Add new product', style: AppStyle.adminMedium16),
                    SizedBox(height: 50.0.h),
                    // Form fields
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left side: Product details
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product name field
                              Text('Product name',
                                  style: AppStyle.adminLight14),
                              SizedBox(height: 10.0.h),
                              AppTextField(
                                controller: nameController,
                                boderRadius: 10.0.r,
                                fillColor: AppColor.greyColor300,
                                hintText: 'Enter your product name',
                                validator: Validator.checkIsEmpty,
                              ),
                              SizedBox(height: 20.0.h),
                              Row(
                                children: [
                                  _buildInputNumber(
                                    controller: priceController,
                                    title: 'Price',
                                    hintText: 'Enter your price',
                                  ),
                                  SizedBox(width: 20.w),
                                  _buildInputNumber(
                                    controller: quantityController,
                                    title: 'Quantity',
                                    hintText: 'Enter your quantity',
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0.h),
                              Row(children: [
                                Expanded(
                                  child: Text('Size',
                                      style: AppStyle.adminLight14),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: Text('Category',
                                      style: AppStyle.adminLight14),
                                )
                              ]),
                              SizedBox(height: 10.0.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        _buildSizeInput(
                                          controller: minSizeController,
                                          hintText: 'Min size',
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Icon(
                                              Icons.arrow_right_alt_rounded),
                                        ),
                                        _buildSizeInput(
                                          controller: maxSizeController,
                                          hintText: 'Max size',
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    child: Container(
                                      height: 53.0.h,
                                      decoration: BoxDecoration(
                                        color: AppColor.greyColor300,
                                        borderRadius:
                                            BorderRadius.circular(10.0.r),
                                      ),
                                      child: DropdownButton<String>(
                                        elevation: 16,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        icon: const SizedBox(),
                                        underline: const SizedBox(),
                                        value: state.idCate,
                                        onChanged: (value) {
                                          context
                                              .getBloc<AdminProductBloc>()
                                              .add(AdOnSelectCategoryEvent(
                                                  value!));
                                        },
                                        items: state.categories.map((category) {
                                          return DropdownMenuItem<String>(
                                            value: category.id,
                                            child: Text(
                                              category.name!.toUpperCase(),
                                              textAlign: TextAlign.center,
                                              style: AppStyle.regular12
                                                  .copyWith(
                                                      color: AppColor
                                                          .adminTextColor),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0.h),
                              Text('Description', style: AppStyle.adminLight14),
                              SizedBox(height: 10.0.h),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                  border: Border.all(color: AppColor.greyColor),
                                ),
                                child: EditableText(
                                  controller: descriptionController,
                                  focusNode: FocusNode(),
                                  style: AppStyle.regular12
                                      .copyWith(color: AppColor.textColor),
                                  cursorColor: AppColor.primaryColor,
                                  maxLines: 5,
                                  backgroundCursorColor: AppColor.primaryColor,
                                  keyboardType: TextInputType.multiline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50.w),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => context
                                    .getBloc<AdminProductBloc>()
                                    .add(const AdImagePickerEventEvent()),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                  child: state.imageFile != null
                                      ? Image.memory(state.imageUnit8List!)
                                      : Image.network(
                                          'https://static.thenounproject.com/png/396915-200.png'),
                                ),
                              ),
                              if (state.imageFile == null)
                                Text(
                                  'Please upload image',
                                  style: AppStyle.adminLight14
                                      .copyWith(color: AppColor.redColor),
                                ),
                              SizedBox(height: 75.h),
                              AppButton(
                                boderRadius: 10.0,
                                buttonText: 'Submit',
                                minimumSize: Size(double.infinity, 50.0.h),
                                onPressed: () {
                                  if (_formKey.currentState!.validate() &&
                                      state.imageFile != null) {
                                    context.getBloc<AdminProductBloc>().add(
                                          AdAddNewProductEvent(AddProductModel(
                                            productName: nameController.text,
                                            price: double.parse(
                                                priceController.text.trim()),
                                            quantity: int.parse(
                                                quantityController.text.trim()),
                                            minSize: int.parse(
                                                minSizeController.text),
                                            maxSize: int.parse(
                                                maxSizeController.text),
                                            cateId: state.idCate!,
                                            desctiption:
                                                descriptionController.text,
                                            image: state.imageFile!,
                                          )),
                                        );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFormEditProduct(BuildContext context,
      {required ProductModel product}) {
    nameController.text = product.name;
    priceController.text = product.price.toString();
    quantityController.text = product.quantity.toString();
    minSizeController.text = product.sizes.first.toString();
    maxSizeController.text = product.sizes.last.toString();
    descriptionController.text = product.description;
    return BlocProvider.value(
      value: BlocProvider.of<AdminProductBloc>(context),
      child: BlocBuilder<AdminProductBloc, AdminProductState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.7,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () => context.getNavigator().pop(),
                        icon: const Icon(Icons.close),
                      ),
                    ),
                    Text('Add new product', style: AppStyle.adminMedium16),
                    SizedBox(height: 50.0.h),
                    // Form fields
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left side: Product details
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product name field
                              Text('Product name',
                                  style: AppStyle.adminLight14),
                              SizedBox(height: 10.0.h),
                              AppTextField(
                                controller: nameController,
                                boderRadius: 10.0.r,
                                fillColor: AppColor.greyColor300,
                                hintText: 'Enter your product name',
                                validator: Validator.checkIsEmpty,
                              ),
                              SizedBox(height: 20.0.h),
                              Row(
                                children: [
                                  _buildInputNumber(
                                    controller: priceController,
                                    title: 'Price',
                                    hintText: 'Enter your price',
                                  ),
                                  SizedBox(width: 20.w),
                                  _buildInputNumber(
                                    controller: quantityController,
                                    title: 'Quantity',
                                    hintText: 'Enter your quantity',
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0.h),
                              Row(children: [
                                Expanded(
                                  child: Text('Size',
                                      style: AppStyle.adminLight14),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: Text('Category',
                                      style: AppStyle.adminLight14),
                                )
                              ]),
                              SizedBox(height: 10.0.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        _buildSizeInput(
                                          controller: minSizeController,
                                          hintText: 'Min size',
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Icon(
                                              Icons.arrow_right_alt_rounded),
                                        ),
                                        _buildSizeInput(
                                          controller: maxSizeController,
                                          hintText: 'Max size',
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    child: Container(
                                      height: 53.0.h,
                                      decoration: BoxDecoration(
                                        color: AppColor.greyColor300,
                                        borderRadius:
                                            BorderRadius.circular(10.0.r),
                                      ),
                                      child: DropdownButton<String>(
                                        elevation: 16,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        icon: const SizedBox(),
                                        underline: const SizedBox(),
                                        value: product.categoryId,
                                        onChanged: (value) {
                                          context
                                              .getBloc<AdminProductBloc>()
                                              .add(AdOnSelectCategoryEvent(
                                                  value!));
                                        },
                                        items: state.categories.map((category) {
                                          return DropdownMenuItem<String>(
                                            value: category.id,
                                            child: Text(
                                              category.name!.toUpperCase(),
                                              textAlign: TextAlign.center,
                                              style:
                                                  AppStyle.regular12.copyWith(
                                                color: AppColor.adminTextColor,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0.h),
                              Text('Description', style: AppStyle.adminLight14),
                              SizedBox(height: 10.0.h),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                  border: Border.all(color: AppColor.greyColor),
                                ),
                                child: EditableText(
                                  controller: descriptionController,
                                  focusNode: FocusNode(),
                                  style: AppStyle.regular12
                                      .copyWith(color: AppColor.textColor),
                                  cursorColor: AppColor.primaryColor,
                                  maxLines: 5,
                                  backgroundCursorColor: AppColor.primaryColor,
                                  keyboardType: TextInputType.multiline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50.w),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => context
                                    .getBloc<AdminProductBloc>()
                                    .add(const AdImagePickerEventEvent()),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                  child: state.imageFile != null
                                      ? Image.memory(state.imageUnit8List!)
                                      : Image.network(product.image),
                                ),
                              ),
                              SizedBox(height: 75.h),
                              AppButton(
                                boderRadius: 10.0,
                                buttonText: 'Submit',
                                minimumSize: Size(double.infinity, 50.0.h),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.getBloc<AdminProductBloc>().add(
                                          AdUpdateProductEvent(AddProductModel(
                                            productName: nameController.text,
                                            price: double.parse(
                                                priceController.text.trim()),
                                            quantity: int.parse(
                                                quantityController.text.trim()),
                                            minSize: int.parse(
                                                minSizeController.text),
                                            maxSize: int.parse(
                                                maxSizeController.text),
                                            cateId: state.idCate!,
                                            desctiption:
                                                descriptionController.text,
                                            image: state.imageFile,
                                          )),
                                        );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Build a text field for size input
  Expanded _buildSizeInput(
      {TextEditingController? controller, String? hintText}) {
    return Expanded(
      child: AppTextField(
        controller: controller,
        isInputSize: true,
        boderRadius: 10.0.r,
        fillColor: AppColor.greyColor300,
        hintText: hintText,
        validator: Validator.checkIsEmpty,
      ),
    );
  }

  Widget _buildInputNumber(
      {String? title, String? hintText, TextEditingController? controller}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? '', style: AppStyle.adminLight14),
          SizedBox(height: 10.0.h),
          AppTextField(
            isInputSize: true,
            controller: controller,
            boderRadius: 10.0.r,
            fillColor: AppColor.greyColor300,
            hintText: hintText,
            validator: Validator.checkNumber,
          ),
        ],
      ),
    );
  }
}
