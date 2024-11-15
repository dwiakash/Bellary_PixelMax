import 'package:flutter/material.dart';
import '/common/widgets/shimmer_custom.dart';
import '/constants/size_unit.dart';
import '/constants/space.dart';
import '/theme/theme_guide.dart';

class ShimmerGrid extends StatelessWidget {
  const ShimmerGrid({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ShimmerCustom(
      child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(SizeUnit.lg),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: SizeUnit.lg,
              mainAxisSpacing: SizeUnit.lg),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) => LayoutBuilder(builder: (context, constraints) {
                return Container(
                    decoration: ThemeGuide.cardDecoration(), height: 100);
              }),
          // separatorBuilder: (_, i) => const HeightFull(),
          itemCount: 10),
    );
  }
}
