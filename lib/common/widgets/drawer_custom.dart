import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/keys.dart';
import 'package:bellaryapp/models/drawer_model.dart';
import 'package:bellaryapp/providers/auth_provider.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/size_unit.dart';
import '../../theme/theme_guide.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    List<Menu> drawerList = DrawerData().list(context);
    return Drawer(
      child: Consumer<AuthProvider>(builder: (context, auth, child) {
        return ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: TextCustom(auth.user?.name ?? "",
                  size: 16, color: Palette.pureWhite),
              accountEmail: TextCustom(auth.user?.email ?? "",
                  size: 16, color: Palette.pureWhite),
              currentAccountPicture: ClipRRect(
                  borderRadius: ThemeGuide.borderRadius(),
                  child: const Icon(Icons.account_circle,
                      size: SizeUnit.xlg * 3, color: Color(0xffD9D9D9))),
              decoration: const BoxDecoration(color: Palette.primary),
            ),
            ...List.generate(drawerList.length, (i) {
              Menu drawer = drawerList[i];
              return DrawerItem(
                  title: drawer.title,
                  onTap: () {
                    homeKey.currentState?.closeDrawer();
                    drawer.onTap();
                  });
            })
          ],
        );
      }),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;

  const DrawerItem({super.key, required this.title, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
