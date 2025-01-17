// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:widgets/constants/constants.dart';

class OtpCountDown extends StatelessWidget {
  final bool showCountdown;
  final VoidCallback? onTimeout, onRetry;

  const OtpCountDown({
    super.key,
    // this.isTimeout = false,
    // this.isRetrying = false,
    this.showCountdown = true,
    this.onRetry,
    this.onTimeout,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showCountdown)
          Text(
            'Request a new otp in ',
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
            ),
          ),
        // Gap(10.sp),
        CountDown(
          showCountdown: showCountdown,
          // isRetrying: isRetrying,
          // isTimeout: isTimeout,
          onTimeout: onTimeout,
          child: TextButton(
            onPressed: onRetry,
            style: TextButton.styleFrom(
              foregroundColor: context.theme.primaryColor,
            ),
            child: const Text('Resend otp'),
          ),
        )
      ],
    );
  }
}

class CountDown extends StatefulWidget {
  final int timeout;
  final Widget child;
  final VoidCallback? onTimeout;
  final bool showCountdown;

  const CountDown({
    super.key,
    this.timeout = 30,
    this.onTimeout,
    required this.child,
    // this.isRetrying = false,
    // this.isTimeout = false,
    this.showCountdown = false,
  });

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  bool isTimeout = false;
  Timer? timer;
  ValueNotifier<int> timeout = ValueNotifier(30);

  @override
  void initState() {
    _init();
    // timeout.value = widget.timeout;
    // timer = Timer.periodic(1.seconds, _callback);
    super.initState();
  }

  void _init() {
    timeout.value = widget.timeout;
    // isTimeout = widget.isTimeout;
    timer?.cancel();
    timer = Timer.periodic(1.seconds, _callback);
  }

  @override
  void didUpdateWidget(covariant CountDown oldWidget) {
    if (widget.showCountdown != oldWidget.showCountdown) {
      // if (widget.isRetrying) {
      // timeout.value = widget.timeout;
      // isTimeout = false;
      _init();
    } else {
      timer?.cancel();
    }
    setState(() {});

    super.didUpdateWidget(oldWidget);
  }

  void _callback(Timer timer) {
    if (timeout.value > 0) {
      timeout.value--;
    } else {
      isTimeout = true;
      timer.cancel();
      if (!mounted) return;
      if (widget.onTimeout != null) widget.onTimeout!();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: _buildChild(),
      secondChild: widget.child,
      crossFadeState: !widget.showCountdown
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: kDuration,
    );
  }

  Widget _buildChild() {
    return ValueListenableBuilder(
      valueListenable: timeout,
      builder: (BuildContext context, int value, Widget? child) {
        final time = value.toString().padLeft(2, '0');
        return Text(
          '00:$time',
          style: context.textTheme.titleSmall,
        );
      },
    );
  }
}
