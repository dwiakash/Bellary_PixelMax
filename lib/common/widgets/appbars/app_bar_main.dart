import 'package:animate_do/animate_do.dart';
import 'package:bellaryapp/common/widgets/select_location_widget.dart';
import 'package:bellaryapp/constants/keys.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/constants/size_unit.dart';
import '/constants/space.dart';

class AppBarMain extends StatelessWidget {
  const AppBarMain({super.key});
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
        child: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(SizeUnit.lg),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Row(children: [
              button(context, Icons.menu,
                  () => homeKey.currentState?.openDrawer()),
              const WidthFull(),
              const Flexible(child: SelectLocationWidget())
            ]),
          ),
          Row(children: [
            const WidthFull(),
            // DropDownCustom(value: value, items: items, onChanged: onChanged)
            button(context, Icons.shopping_cart_outlined, () {}),
            const WidthFull(),
            button(context, Icons.notifications_outlined, () {
              context.push(Routes.notification);
            }),
          ]),
        ]),
      ),
    ));
  }

  IconButton button(
      BuildContext context, IconData icon, VoidCallback onPressed) {
    return IconButton.outlined(
        // style: Theme.of(context)
        //     .iconButtonTheme
        //     .style
        //     ?.copyWith(shape: const WidgetStatePropertyAll(CircleBorder())),
        onPressed: onPressed,
        icon: Icon(icon));
  }
}
