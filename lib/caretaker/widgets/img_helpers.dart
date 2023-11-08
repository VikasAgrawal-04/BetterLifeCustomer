import 'dart:convert';

import 'package:flutter/material.dart';

class ImgHelper {
  static Image imgFromBase64(String base64) {
    return Image.memory(
      base64Decode(base64),
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(seconds: 2),
          curve: Curves.easeOut,
          child: child,
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png');
      },
    );
  }
}
