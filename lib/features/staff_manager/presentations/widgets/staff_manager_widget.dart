import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_admin/common/components/buttons/app_button.dart';
import 'package:web_admin/common/components/dialog/app_dialog.dart';
import 'package:web_admin/common/components/textfields/app_text_field.dart';
import 'package:web_admin/common/components/textfields/app_text_field_password.dart';
import 'package:web_admin/common/constants/app_color.dart';
import 'package:web_admin/common/constants/app_style.dart';
import 'package:web_admin/common/extensions/build_context_extension.dart';
import 'package:web_admin/entities/models/user_model.dart';
import 'package:web_admin/features/staff_manager/presentations/bloc/staff_manager_bloc.dart';
import 'package:web_admin/utils/validator.dart';

// ignore: must_be_immutable
class StaffManagerWidget extends StatelessWidget {
  StaffManagerWidget({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StaffManagerBloc, StaffManagerState>(
      listener: (context, state) {
        if (state.isLoading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }
      },
      builder: (context, state) {
        return Form(
          key: _globalKey,
          child: Container(
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
                _buildAddStaffButton(context),
                const SizedBox(height: 30.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.greyColor),
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.staff.length,
                      separatorBuilder: (_, __) => const Divider(
                        indent: 0,
                        endIndent: 0,
                      ),
                      itemBuilder: (context, index) {
                        return _buildStaffListItem(
                            context, state.staff[index], index);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddStaffButton(BuildContext context) {
    return AppButton(
      buttonText: 'Add staff',
      boderRadius: 5.0,
      minimumSize: Size(100.w, 50.0.h),
      onPressed: () {
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => _buildFormAddStaff(context),
        );
        // nameController.clear();
      },
    );
  }

  Widget _buildStaffListItem(
      BuildContext context, UserModel userModel, int index) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => _buildFormUpdateStaff(context, userModel: userModel),
      ),
      child: ListTile(
        leading: Text('${index + 1}', style: AppStyle.regular12),
        title: Row(
          children: [
            Image.network(
              userModel.avatar!,
              width: 100.0.w,
            ),
            SizedBox(width: 50.0.w),
            Expanded(
              child: Text(
                userModel.name!,
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
          onPressed: () => _showDeleteStaffDialog(context, userModel),
        ),
      ),
    );
  }

  void _showDeleteStaffDialog(BuildContext context, UserModel userModel) {
    AppDiaLog.showAwesomeConfirmDialog(
      context,
      content: 'Do you want to delete this staff?',
      btnOkOnPress: () => context
          .getBloc<StaffManagerBloc>()
          .add(StaffManagerDeleteStaffEvent(userModel)),
    );
  }

  Widget _buildFormUpdateStaff(BuildContext context,
      {required UserModel userModel}) {
    emailController = TextEditingController(text: userModel.email);
    nameController = TextEditingController(text: userModel.name);
    passwordController = TextEditingController(text: userModel.password);
    return BlocProvider.value(
      value: BlocProvider.of<StaffManagerBloc>(context),
      child: BlocBuilder<StaffManagerBloc, StaffManagerState>(
        builder: (context, state) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.86,
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
                          'Update new staff',
                          style: AppStyle.adminMedium16,
                        ),
                      ),
                      SizedBox(height: 50.0.h),
                      Center(
                        child: GestureDetector(
                          onTap: () => context
                              .getBloc<StaffManagerBloc>()
                              .add(const StaffManagerImagePickerEvent()),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0.r),
                            child: state.imageFile != null
                                ? Image.memory(state.imageUnit8List!)
                                : Image.network(
                                    userModel.avatar!,
                                    width: 100.w,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Name',
                          style: AppStyle.adminLight14,
                        ),
                      ),
                      SizedBox(height: 10.0.h),
                      AppTextField(
                        controller: nameController,
                        boderRadius: 10.0.r,
                        fillColor: AppColor.greyColor300,
                        hintText: 'Enter staff name',
                        validator: Validator.checkIsEmpty,
                      ),
                      SizedBox(height: 25.0.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: AppStyle.adminLight14,
                        ),
                      ),
                      SizedBox(height: 10.0.h),
                      AppTextField(
                        controller: emailController,
                        readOnly: true,
                        boderRadius: 10.0.r,
                        fillColor: AppColor.greyColor300,
                        hintText: 'Enter staff email',
                        validator: Validator.checkEmail,
                      ),
                      SizedBox(height: 25.0.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: AppStyle.adminLight14,
                        ),
                      ),
                      SizedBox(height: 10.0.h),
                      AppTextFieldPassword(
                        controller: passwordController,
                        boderRadius: 10.0.r,
                        fillColor: AppColor.greyColor300,
                        hintText: 'Enter staff password',
                        validator: Validator.checkPassword,
                      ),
                      const SizedBox(height: 40.0),
                      AppButton(
                        boderRadius: 10.0,
                        buttonText: 'Submit',
                        onPressed: () {
                          if (_globalKey.currentState!.validate()) {
                            context.getBloc<StaffManagerBloc>().add(
                                  StaffManagerUpdateStaffEvent(
                                      UserModel(
                                        id: userModel.id,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text,
                                        avatar: state.imageFile,
                                      ),
                                      userModel.password!),
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
          );
        },
      ),
    );
  }

  Widget _buildFormAddStaff(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<StaffManagerBloc>(context),
      child: BlocBuilder<StaffManagerBloc, StaffManagerState>(
        builder: (context, state) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.86,
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
                          'Add new staff',
                          style: AppStyle.adminMedium16,
                        ),
                      ),
                      SizedBox(height: 50.0.h),
                      Center(
                        child: GestureDetector(
                          onTap: () => context
                              .getBloc<StaffManagerBloc>()
                              .add(const StaffManagerImagePickerEvent()),
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
                          'Name',
                          style: AppStyle.adminLight14,
                        ),
                      ),
                      SizedBox(height: 10.0.h),
                      AppTextField(
                        controller: nameController,
                        boderRadius: 10.0.r,
                        fillColor: AppColor.greyColor300,
                        hintText: 'Enter staff name',
                        validator: Validator.checkIsEmpty,
                      ),
                      SizedBox(height: 25.0.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: AppStyle.adminLight14,
                        ),
                      ),
                      SizedBox(height: 10.0.h),
                      AppTextField(
                        controller: emailController,
                        boderRadius: 10.0.r,
                        fillColor: AppColor.greyColor300,
                        hintText: 'Enter staff email',
                        validator: Validator.checkEmail,
                      ),
                      SizedBox(height: 25.0.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: AppStyle.adminLight14,
                        ),
                      ),
                      SizedBox(height: 10.0.h),
                      AppTextFieldPassword(
                        controller: passwordController,
                        boderRadius: 10.0.r,
                        fillColor: AppColor.greyColor300,
                        hintText: 'Enter staff password',
                        validator: Validator.checkPassword,
                      ),
                      const SizedBox(height: 40.0),
                      AppButton(
                        boderRadius: 10.0,
                        buttonText: 'Submit',
                        onPressed: () {
                          if (state.imageFile != null &&
                              _globalKey.currentState!.validate()) {
                            context.getBloc<StaffManagerBloc>().add(
                                  StaffManagerAddStaffEvent(
                                    UserModel(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                      avatar: state.imageFile,
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
          );
        },
      ),
    );
  }
}
