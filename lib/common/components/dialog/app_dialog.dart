import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:web_admin/common/constants/app_style.dart';

class AppDiaLog {
  static void showAwesomeSuccessDialog(BuildContext context,
      {String? content,
      void Function()? btnOkOnPress,
      void Function()? btnCancelOnPress}) {
    AwesomeDialog(
      context: context,
      animType: AnimType.rightSlide,
      dialogBorderRadius: BorderRadius.circular(20.0),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      headerAnimationLoop: true,
      showCloseIcon: false,
      desc: content,
      dialogType: DialogType.noHeader,
      descTextStyle: AppStyle.regular18,
      btnOkOnPress: btnOkOnPress,
      btnCancelOnPress: () {},
    ).show();
  }

  static void showAwesomeConfirmDialog(BuildContext context,
      {String? content,
      void Function()? btnOkOnPress,
      void Function()? btnCancelOnPress}) {
    AwesomeDialog(
            context: context,
            animType: AnimType.rightSlide,
            width: 500,
            dialogBorderRadius: BorderRadius.circular(20.0),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            headerAnimationLoop: true,
            showCloseIcon: false,
            desc: content,
            dialogType: DialogType.noHeader,
            descTextStyle: AppStyle.regular18,
            btnOkOnPress: btnOkOnPress,
            btnCancelOnPress: () {})
        .show();
  }
}
