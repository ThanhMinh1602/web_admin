import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:web_admin/common/components/buttons/app_button.dart';
import 'package:web_admin/common/components/dialog/app_dialog.dart';
import 'package:web_admin/common/components/textfields/app_text_field.dart';
import 'package:web_admin/common/constants/app_color.dart';
import 'package:web_admin/common/constants/app_style.dart';
import 'package:web_admin/common/extensions/build_context_extension.dart';
import 'package:web_admin/entities/models/category_model.dart';
import 'package:web_admin/features/category_admin/presentations/bloc/admin_category_bloc.dart';
import 'package:web_admin/services/utils/validator.dart';

class AdminCategoryWidget extends StatelessWidget {
  AdminCategoryWidget({super.key});
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCategoryBloc, AdminCategoryState>(
      listener: (context, state) {
        if (state.isLoading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }
      },
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
              _buildAddCategoryButton(context),
              const SizedBox(height: 30.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.greyColor),
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.categories.length,
                    separatorBuilder: (_, __) => const Divider(
                      indent: 0,
                      endIndent: 0,
                    ),
                    itemBuilder: (context, index) {
                      return _buildCategoryListItem(
                          context, state.categories[index], index);
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

  Widget _buildAddCategoryButton(BuildContext context) {
    return AppButton(
      buttonText: 'Add category',
      boderRadius: 5.0,
      minimumSize: Size(100.w, 50.0.h),
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => _buildFormAddCategory(context),
        );
        nameController.clear();
      },
    );
  }

  Widget _buildCategoryListItem(
      BuildContext context, CategoryModel category, int index) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => _buildFormUpdateCategory(context, category: category),
      ),
      child: ListTile(
        leading: Text('${index + 1}', style: AppStyle.regular12),
        title: Row(
          children: [
            Image.network(
              category.image,
              width: 100.0.w,
            ),
            SizedBox(width: 50.0.w),
            Expanded(
              child: Text(
                category.name!.toUpperCase(),
                style: AppStyle.regular12,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete_outline,
            color: AppColor.redColor,
          ),
          onPressed: () => _showDeleteCategoryDialog(context, category),
        ),
      ),
    );
  }

  void _showDeleteCategoryDialog(BuildContext context, CategoryModel category) {
    AppDiaLog.showAwesomeConfirmDialog(
      context,
      content: 'Do you want to delete this category?',
      btnOkOnPress: () {
        context
            .getBloc<AdminCategoryBloc>()
            .add(AdDeleteCategoryEvent(category.id!));
      },
    );
  }

  Widget _buildFormUpdateCategory(BuildContext context,
      {required CategoryModel category}) {
    final TextEditingController nameController =
        TextEditingController(text: category.name);
    return BlocProvider.value(
      value: BlocProvider.of<AdminCategoryBloc>(context),
      child: BlocBuilder<AdminCategoryBloc, AdminCategoryState>(
        builder: (context, state) {
          return Form(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.6,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        Center(
                          child: Text(
                            'Add new category',
                            style: AppStyle.adminMedium16,
                          ),
                        ),
                        SizedBox(height: 50.0.h),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .getBloc<AdminCategoryBloc>()
                                  .add(const AdImagePickerEvent());
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0.r),
                              child: state.imageFile != null
                                  ? Image.memory(state.imageUnit8List!)
                                  : Image.network(
                                      category.image!,
                                    ),
                            ),
                          ),
                        ),
                        if (category.image == null)
                          Center(
                            child: Text(
                              'Please upload image',
                              style: AppStyle.adminLight14
                                  .copyWith(color: AppColor.redColor),
                            ),
                          ),
                        SizedBox(height: 25.0.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Category name',
                            style: AppStyle.adminLight14,
                          ),
                        ),
                        SizedBox(height: 10.0.h),
                        AppTextField(
                          controller: nameController,
                          boderRadius: 10.0.r,
                          fillColor: AppColor.greyColor300,
                          hintText: 'Enter your category name',
                          validator: Validator.checkIsEmpty,
                        ),
                        const SizedBox(height: 40.0),
                        AppButton(
                          boderRadius: 10.0,
                          buttonText: 'Submit',
                          onPressed: () {
                            if (state.imageFile != null) {
                              context.getBloc<AdminCategoryBloc>().add(
                                    AdUpdateCategoryEvent(
                                      CategoryModel(
                                        id: category.id!,
                                        name: nameController.text,
                                        image: state.imageFile,
                                        createAt: Timestamp.now(),
                                      ),
                                    ),
                                  );
                            }
                          },
                          minimumSize: const Size.fromHeight(50.0),
                        )
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () => context.getNavigator().pop(),
                        icon: const Icon(Icons.close),
                      ),
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

  Widget _buildFormAddCategory(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AdminCategoryBloc>(context),
      child: BlocBuilder<AdminCategoryBloc, AdminCategoryState>(
        builder: (context, state) {
          return Form(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.6,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        Center(
                          child: Text(
                            'Add new category',
                            style: AppStyle.adminMedium16,
                          ),
                        ),
                        SizedBox(height: 50.0.h),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .getBloc<AdminCategoryBloc>()
                                  .add(const AdImagePickerEvent());
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0.r),
                              child: state.imageFile != null
                                  ? Image.memory(state.imageUnit8List!)
                                  : Image.network(
                                      'https://static.thenounproject.com/png/396915-200.png',
                                      width: 100.w,
                                    ),
                            ),
                          ),
                        ),
                        if (state.imageFile == null)
                          Center(
                            child: Text(
                              'Please upload image',
                              style: AppStyle.adminLight14
                                  .copyWith(color: AppColor.redColor),
                            ),
                          ),
                        SizedBox(height: 25.0.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Category name',
                            style: AppStyle.adminLight14,
                          ),
                        ),
                        SizedBox(height: 10.0.h),
                        AppTextField(
                          controller: nameController,
                          boderRadius: 10.0.r,
                          fillColor: AppColor.greyColor300,
                          hintText: 'Enter your category name',
                          validator: Validator.checkIsEmpty,
                        ),
                        const SizedBox(height: 40.0),
                        AppButton(
                          boderRadius: 10.0,
                          buttonText: 'Submit',
                          onPressed: () {
                            if (state.imageFile != null) {
                              context.getBloc<AdminCategoryBloc>().add(
                                    AdAddNewCategoryEvent(
                                      CategoryModel(
                                        id: '',
                                        name: nameController.text,
                                        image: state.imageFile!,
                                        createAt: Timestamp.now(),
                                      ),
                                    ),
                                  );
                            }
                          },
                          minimumSize: const Size.fromHeight(50.0),
                        )
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () => context.getNavigator().pop(),
                        icon: const Icon(Icons.close),
                      ),
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
}
