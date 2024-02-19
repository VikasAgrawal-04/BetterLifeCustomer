import 'package:flutter/material.dart';

Future<void> bottomSheet({
  required BuildContext context,
  required Widget child,
  bool? scroll,
}) {
  return showModalBottomSheet<void>(
    backgroundColor: Colors.white,
    isScrollControlled: scroll ?? true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: child,
          );
        },
      );
    },
  );
}
