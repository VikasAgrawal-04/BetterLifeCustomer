import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MyCrossFade extends StatelessWidget {
  final Widget child;
  final Widget? placeHolder;
  final bool isLoading;
  const MyCrossFade(
      {Key? key, this.isLoading = false, required this.child, this.placeHolder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      // firstCurve: kCurve,
      // secondCurve: kCurve,
      duration: kDuration,
      // crossFadeState: !isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      // firstChild: placeHolder ?? _loader(),
      // secondChild: child,
      child: isLoading ? _loader() : child,
    );
  }

  Widget _loader() => const SizedBox.square(
        dimension: 50,
        child: Center(
          child: CircularProgressIndicator(),
        ),
        // dimension: 40.height,
      );
}
