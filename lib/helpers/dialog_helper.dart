import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static void showInfoDialog({
    required BuildContext context,
    required String title,
    required String description,
    VoidCallback? onOkPressed,
    VoidCallback? onCancelPressed,
  }) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: title,
      desc: description,
      btnCancelOnPress: onCancelPressed,
      btnOkOnPress: onOkPressed,
    ).show();
  }
}
