import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyScreen extends StatefulWidget {
  final String? message;
  const EmptyScreen({Key? key, this.message}) : super(key: key);

  @override
  State<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          'assets/animations/box-empty.json',
          controller: _controller,
          animate: true,
          width: MediaQuery.of(context).size.width,
          frameRate: FrameRate(120),
          onLoaded: onLoaded,
        ),
        Text(
          widget.message ?? 'No data found',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  void onLoaded(LottieComposition composition) {
    _controller
      ..drive(CurveTween(curve: Curves.easeIn))
      ..repeat();
  }
}
