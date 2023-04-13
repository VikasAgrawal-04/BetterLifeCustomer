import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class DialogService {
  static const _duration = Duration(milliseconds: 375);

  static Future<T?> showDialog<T>({
    required Widget child,
  }) async {
    final result = await Get.dialog<T>(
      child,
      transitionCurve: Curves.elasticOut,
      transitionDuration: _duration,
    );
    return result;
  }

  static void failure(
    NetworkExceptions error, {
    void Function()? onCancel,
  }) {
    Get.dialog<void>(
      NetworkErrorDialog(
        message: NetworkExceptions.getErrorMessage(error),
        onCancel: onCancel ?? Get.back<void>,
      ),
      transitionCurve: Curves.elasticOut,
      transitionDuration: _duration,
    );
  }

  static void success(
    String success, {
    required void Function() onTap,
  }) {
    Get.dialog<void>(
      SuccessDialog(
        onTap: () => onTap(),
        message: success,
      ),
      transitionCurve: Curves.elasticOut,
      transitionDuration: _duration,
    );
  }

  static void error(
    String error, {
    VoidCallback? onTap,
  }) {
    Get.dialog<void>(
      ErrorDialog(
        message: error,
        onTap: onTap ?? Get.back<void>,
      ),
      transitionCurve: Curves.elasticOut,
      transitionDuration: _duration,
    );
  }
}
