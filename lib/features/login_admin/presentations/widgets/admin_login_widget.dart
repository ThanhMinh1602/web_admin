import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_admin/common/components/buttons/app_button.dart';
import 'package:web_admin/common/components/textfields/app_text_field.dart';
import 'package:web_admin/common/components/textfields/app_text_field_password.dart';
import 'package:web_admin/common/constants/app_color.dart';
import 'package:web_admin/common/constants/app_style.dart';
import 'package:web_admin/common/extensions/build_context_extension.dart';
import 'package:web_admin/entities/models/login_request.dart';
import 'package:web_admin/features/login_admin/presentations/bloc/admin_login_bloc.dart';
import 'package:web_admin/utils/validator.dart';

class AdminLoginWidget extends StatelessWidget {
  const AdminLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColor.adminBackgroundColor,
      body: BlocConsumer<AdminLoginBloc, AdminLoginState>(
        listener: (context, state) {
          if (state.isLoading) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Center(
              child: Container(
                width: 900.w,
                height: 564.h,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10.0.r),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: AppColor.blackColor.withOpacity(0.25))
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: ClipRRect(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10.0.r)),
                      child: Image.network(
                          'https://cdn.pixabay.com/photo/2024/02/25/13/30/shoes-8595773_1280.jpg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover),
                    )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(40.0.h),
                      child: ListView(
                        children: [
                          Text('Login', style: AppStyle.adminSemibold22),
                          Text('Nike shoe shop admin',
                              style: AppStyle.adminLight16),
                          SizedBox(height: 40.0.h),
                          Text('E-Mail', style: AppStyle.adminLight14),
                          SizedBox(height: 5.0.h),
                          AppTextField(
                            controller: emailController,
                            fillColor: AppColor.greyColor300,
                            boderRadius: 5.0,
                            hintText: 'Enter your Email',
                            validator: Validator.checkIsEmpty,
                          ),
                          SizedBox(height: 20.0.h),
                          Text('Password', style: AppStyle.adminLight14),
                          SizedBox(height: 5.0.h),
                          AppTextFieldPassword(
                            controller: passwordController,
                            fillColor: AppColor.greyColor300,
                            boderRadius: 5.0,
                            hintText: 'Enter your password',
                            validator: Validator.checkIsEmpty,
                            onFieldSubmitted: (p0) {
                              if (formKey.currentState!.validate()) {
                                context.getBloc<AdminLoginBloc>().add(
                                      AdminLoginEvents(
                                        LoginRequest(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      ),
                                    );
                              }
                            },
                          ),
                          SizedBox(height: 61.h),
                          AppButton(
                            boderRadius: 5.0.r,
                            buttonText: 'Login',
                            minimumSize: Size(100.w,70.0.h),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.getBloc<AdminLoginBloc>().add(
                                      AdminLoginEvents(
                                        LoginRequest(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      ),
                                    );
                              }
                            },
                          )
                        ],
                      ),
                    ))
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
