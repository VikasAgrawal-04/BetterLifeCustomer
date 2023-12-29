import 'package:flutter/material.dart';
import 'package:widgets/decoration/my_decoration.dart';

class DialogLayout extends StatelessWidget {
  final Widget child;

  const DialogLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: MyDecoration.dialogShape,
      child: child,
    );
  }
}
