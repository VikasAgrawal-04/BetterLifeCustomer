import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  const PhotoViewer({
    required this.url,
    super.key,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.black.withAlpha(200),
      ),
      body: PhotoView(
        imageProvider: NetworkImage(url),
      ),
    );
  }
}
