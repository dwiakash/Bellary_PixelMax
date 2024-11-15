import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/divider.dart';
import '../../../common/widgets/list_tile_custom.dart';
import '../../../constants/assets/local_icons.dart';
import '../../../constants/size_unit.dart';
import '../../../services/route/routes.dart';
import '../../../theme/palette.dart';
import '../../../theme/theme_guide.dart';

class ProfileListTIle extends StatelessWidget {
  const ProfileListTIle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeGuide.cardDecoration(),
      padding: const EdgeInsets.symmetric(vertical: SizeUnit.lg),
      child: Column(children: [
        InkWell(
          onTap: () => context.push(Routes.updateProfile),
          child: CustomListTile(
              padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
              img: LocalIcons.facebook,
              titleText: 'Profile Details',
              subtitleText: 'View Your Details'),
        ),
        DividerCustom(lineColor: Palette.secondary.withOpacity(.2)),
        // InkWell(
        //   onTap: () {
        //     LocalStorage.setString(StorageConstants.languageCode, 'hi');
        //     MyApp.setLocale(context, Locale('hi'));
        //   },
        //   child: CustomListTile(
        //       padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
        //       icon: LocalIcons.language,
        //       titleText:
        //           LanguageString.of(context)?.appName ?? 'Select Language',
        //       subtitleText: 'Choose Language Here'),
        // ),
        // DividerCustom(lineColor: Palette.secondary.withOpacity(.2)),
        InkWell(
            onTap: () => context.push("Routes.help"),
            child: CustomListTile(
                padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
                img: LocalIcons.facebook,
                titleText: 'Help & Support',
                subtitleText: '24x7 Customer Service')),
      ]),
    );
  }
}
