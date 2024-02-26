import 'dart:convert';

import 'package:flutter/material.dart';

class Base64Img extends StatelessWidget {
  final String urlToImage;
  final void Function()? onTap, onLongPress;
  const Base64Img(
      {required this.urlToImage, this.onTap, this.onLongPress, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.memory(
        base64Decode(urlToImage),
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) return child;
          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            child: child,
          );
        },
      ),
    );
  }
}
