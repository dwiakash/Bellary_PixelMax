import 'package:animate_do/animate_do.dart';
import 'package:animated_visibility/animated_visibility.dart';
import 'package:bellaryapp/common/widgets/bottom_bar/bottom_bar_data.dart';
import 'package:bellaryapp/common/widgets/bottom_bar/bottom_bar_item.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:bellaryapp/theme/theme_guide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool isVisible = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => initialize());
    super.initState();
  }

  void initialize() {
    isVisible = true;
    setState(() {});
  }

  List data = BottomBarData().data;
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: SizeUnit.md, horizontal: SizeUnit.lg),
        decoration: ThemeGuide.cardDecoration(color: Palette.pureWhite),
        child: AnimatedVisibility(
          visible: isVisible,
          enterDuration: const Duration(milliseconds: 500),
          enter: slideInVertically(),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ...List.generate(
                data.length,
                (index) => BottomBarItem(
                      data: data[index],
                    )),
            // const CustomFloatingActionButton()
          ]),
        ),
      ),
    );
  }
}
