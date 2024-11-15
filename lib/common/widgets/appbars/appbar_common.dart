import 'package:animate_do/animate_do.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/keys.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarCommon extends StatelessWidget {
  const AppBarCommon({
    super.key,
    this.title = '',
    this.titleWidget,
    this.hadCart = false,
    this.hadMenu = false,
    this.automaticLeadingImplies = true,
    this.hadNotifications = false,
    this.backgroundColor,
    this.foregroundColor,
    this.textSize,
    this.actions = const [],
  });
  final String title;
  final List<Widget> actions;
  final Color? backgroundColor, foregroundColor;
  final bool automaticLeadingImplies, hadMenu;
  final Widget? titleWidget;
  final bool hadCart, hadNotifications;
  final double? textSize;
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
        child: SafeArea(
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: SizeUnit.lg),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Row(children: [
              if (hadMenu)
                button(context, Icons.menu,
                    () => homeKey.currentState?.openDrawer())
              else if (automaticLeadingImplies) ...[
                button(context, Icons.arrow_back_ios_new, () => context.pop()),
              ],
              const WidthFull(),
              Flexible(
                  child: titleWidget ??
                      TextCustom(
                        title,
                        maxLines: 1,
                        align: TextAlign.start,
                        color: foregroundColor ?? Palette.dark,
                        size: textSize ?? 18,
                        fontWeight: FontWeight.w800,
                      )),
            ]),
          ),
          Row(children: [
            if (hadCart) ...[
              const WidthFull(),
              button(context, Icons.shopping_cart_outlined, () {})
            ],
            if (hadNotifications) ...[
              const WidthFull(),
              button(context, Icons.notifications_outlined, () {})
            ],
            ...actions
          ]),
        ]),
      ),
    ));
  }

  IconButton button(
      BuildContext context, IconData icon, VoidCallback onPressed) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: foregroundColor ?? Palette.dark));
  }
}
