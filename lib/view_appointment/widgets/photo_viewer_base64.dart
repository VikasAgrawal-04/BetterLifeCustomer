import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewerBase64 extends StatelessWidget {
  const PhotoViewerBase64({required this.url, super.key});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.black.withAlpha(200),
      ),
      body: PhotoView(
        imageProvider: MemoryImage(base64Decode(url)),
      ),
    );
  }
}
