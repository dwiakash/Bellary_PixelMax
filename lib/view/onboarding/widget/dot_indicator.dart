// Dot indicator widget

import 'package:bellaryapp/theme/palette.dart';
import 'package:flutter/material.dart';

import '../../../constants/size_unit.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
    required this.color,
  });

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: SizeUnit.lg),
      // padding: EdgeInsets.all(SizeUnit.lg),
      height: 8,
      width: size,
      decoration: BoxDecoration(
        color: isActive ? color : Palette.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }

  double get size => isActive ? 36 : 8;
}
