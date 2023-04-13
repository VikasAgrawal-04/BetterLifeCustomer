// import 'package:background_location/widgets/image/shimmer_animation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class MyNetworkImage extends StatelessWidget {
  final String? urlToImage;
  final double? borderRadius;
  final bool isLoading, isCircle, useImageBuilder, autoHeight;
  final void Function()? onTap, onLongPress;
  final double? height, width;
  final int? cacheHeight, cacheWidth;
  final Border? border;
  final BoxFit fit;
  const MyNetworkImage({
    Key? key,
    this.isLoading = false,
    this.isCircle = false,
    this.autoHeight = false,
    this.useImageBuilder = true,
    this.urlToImage,
    this.height,
    this.onTap,
    this.onLongPress,
    this.fit = BoxFit.cover,
    this.width,
    this.border,
    this.cacheHeight,
    this.cacheWidth,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final size = mq.size;
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: CachedNetworkImage(
        fit: fit,
        placeholder: placeHolder,
        memCacheHeight: cacheHeight,
        memCacheWidth: cacheWidth ?? size.width.toInt(),
        errorWidget: errorWidget,
        height: height,
        width: width,
        imageBuilder: useImageBuilder ? imageBuilder : null,
        imageUrl: urlToImage ??
            'https://www.slntechnologies.com/wp-content/uploads/2017/08/ef3-placeholder-image.jpg',
        // imageUrl: urlToImage!,
      ),
    );
  }

  Widget imageBuilder(context, imageProvider) {
    return _container(
      image: DecorationImage(image: imageProvider, fit: fit),
    );
  }

  Widget _container({DecorationImage? image, Color? color}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: isCircle ? null : kBorderRadius,
        color: color,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        border: border,
        image: image,
      ),
    );
  }

  Widget placeHolder(BuildContext context, String _) =>
      _container(color: Colors.grey.shade200);
  Widget errorWidget(BuildContext context, String _, dynamic __) =>
      const Icon(Icons.error_outline_outlined);
}
