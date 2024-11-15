import 'package:flutter/material.dart';
import '/common/widgets/text.dart';

import 'package:fluttertoast/fluttertoast.dart';
import '/constants/keys.dart';
import '/constants/size_unit.dart';
import '/theme/palette.dart';

showMessage(String message, {Duration duration = const Duration(seconds: 3)}) {
  return snackbarKey.currentState
    ?..hideCurrentSnackBar
    ..showSnackBar(
      SnackBar(
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(SizeUnit.lg),
        content: TextCustom(
          message,
          fontWeight: FontWeight.bold,
          color: Palette.pureWhite,
        ),
      ),
    );
}

showToastMessage(String message) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      fontSize: 16.0);
}
