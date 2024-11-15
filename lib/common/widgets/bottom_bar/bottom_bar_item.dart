import 'package:bellaryapp/common/widgets/bottom_bar/bottom_bar_data.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class BottomBarItem extends StatelessWidget {
  BottomBarItem({super.key, required this.data});
  final BottomBarDatum data;

  @override
  Widget build(BuildContext context) {
    isSelected = GoRouterState.of(context).uri.path == data.route;
    return InkWell(
      onTap: () => context.go(data.route),
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(
            vertical: SizeUnit.sm * .5,
            horizontal: isSelected ? SizeUnit.lg : SizeUnit.md),
        duration: const Duration(milliseconds: 400),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          image(data.image),
          const HeightHalf(),
          TextCustom(
            data.title,
            color: iconColor,
            fontWeight: FontWeight.w500,
            size: 10,
          )
        ]),
      ),
    );
  }

  Widget image(String image) =>
      Image.asset(image, color: iconColor, height: 25, width: 25);

  bool isSelected = false;

  Color? get iconColor => isSelected ? Palette.primary : Palette.grey;
}
