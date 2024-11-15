import 'package:animate_do/animate_do.dart';
import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/common/widgets/network_image_cus.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:bellaryapp/utilities/extensions/context_extention.dart';
import 'package:flutter/material.dart';

class AppBarImageStacked extends StatelessWidget {
  const AppBarImageStacked({
    super.key,
    this.title = '',
    this.titleWidget,
    required this.head,
    required this.desc,
    required this.image,
    this.heroTag,
    this.hadMenu = false,
  });
  final bool hadMenu;
  final String image;
  final String title;
  final Widget? titleWidget;
  final String head, desc;
  final UniqueKey? heroTag;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.widthFull(),
      height: 400,
      child: Stack(
        fit: StackFit.expand,
        children: [
          image.contains('http')
              ? Hero(
                  tag: heroTag ?? UniqueKey(),
                  child: NetworkImageCustom(logo: image))
              : FadeInDown(child: Image.asset(image, fit: BoxFit.cover)),
          ColoredBox(
            color: Palette.primary.withOpacity(.25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppBarCommon(
                  foregroundColor: Palette.pureWhite,
                  hadMenu: hadMenu,
                  titleWidget: titleWidget,
                  title: title,
                  textSize: 16,
                  hadCart: true,
                  hadNotifications: true),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(head,
                          color: Palette.pureWhite,
                          fontWeight: FontWeight.w700,
                          size: 26),
                      const HeightHalf(),
                      TextCustom(desc, color: Palette.pureWhite, size: 18),
                    ]),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
