import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_admin/common/constants/app_color.dart';
import 'package:web_admin/common/constants/app_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.validator,
      this.fillColor = AppColor.whiteColor,
      this.readOnly,
      this.boderRadius = 50,
      this.isInputSize = false,
      this.keyboardType});
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final bool? readOnly;
  final double? boderRadius;
  final bool isInputSize;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly ?? false,
      style: AppStyle.regular12,
      inputFormatters: isInputSize
          ? [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9,]+')),
            ]
          : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: 8.sp,
          color: Colors.red,
          fontWeight: FontWeight.w600,
        ),
        contentPadding:
            EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 16.0),
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(boderRadius!.r),
          ),
        ),
      ),
    );
  }
}
