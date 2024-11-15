import 'package:flutter/material.dart';
import '/common/widgets/network_image_cus.dart';
import '/theme/palette.dart';

class ImageCircle extends StatelessWidget {
  const ImageCircle({super.key, required this.radius, required this.image});
  final double radius;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Palette.primary.withOpacity(.5), shape: BoxShape.circle),
      child:
          NetworkImageCustom(logo: image),
    );
  }
}
