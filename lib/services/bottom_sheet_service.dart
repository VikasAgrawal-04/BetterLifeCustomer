import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/constants/constants.dart';

class BottomSheetService {
  static void showSheet({required Widget child, EdgeInsets? padding}) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 0.1,
            ),
          ],
        ),
        padding: padding ?? kPadding,
        child: child,
      ),
      enterBottomSheetDuration: 175.milliseconds,
      exitBottomSheetDuration: 175.milliseconds,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withOpacity(0.1),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  static showCupertinoSheet({required Widget child}) {
    showCupertinoModalPopup(
      context: Get.overlayContext!,
      builder: (context) => Container(
        padding: kPadding,
        // decoration: MyDecoration.bottomSheetDecoration(),
        child: child,
      ),
    );
  }
}
