import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/constants/assets/local_images.dart';

class NetworkImageCustom extends StatelessWidget {
  const NetworkImageCustom({
    super.key,
    required this.logo,
    this.placeholderImage,
    this.width,
    this.height,
    this.color,
  });

  final String logo;
  final Color? color;
  final String? placeholderImage;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    if (logo.isEmpty) return placeholder();
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
          imageUrl: logo,
          fit: BoxFit.cover,
          color: color,
          placeholder: (context, url) => placeholder(),
          errorWidget: (context, error, stackTrace) => errorWidget()),
    );
  }

  Widget placeholder() {
    String temp = placeholderImage ?? LocalImages.placeHolder;
    return Image.asset(temp, color: color, fit: BoxFit.cover);
  }

  Widget errorWidget() {
    String temp = LocalImages.placeHolder;
    return Image.asset(temp, color: color, fit: BoxFit.cover);
  }
}
