import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:flutter/material.dart';

class AuthHeading extends StatelessWidget {
  const AuthHeading({
    super.key,
    required this.title,
    required this.desc,
    this.isStart = false,
  });
  final String title;
  final String desc;
  final bool isStart;
  @override
  Widget build(BuildContext context) {
    TextAlign align = isStart ? TextAlign.start : TextAlign.center;
    return Column(
      crossAxisAlignment:
          isStart ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        TextCustom(title, align: align, fontWeight: FontWeight.w800, size: 30),
        const HeightHalf(),
        TextCustom(desc, align: align, fontWeight: FontWeight.w600, size: 18),
      ],
    );
  }
}
