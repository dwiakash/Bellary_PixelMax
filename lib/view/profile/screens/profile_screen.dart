import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/common/widgets/list_tile_custom.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/utilities/extensions/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../common/widgets/custom_scaffold.dart';
import '../../../common/widgets/text.dart';
import '../../../constants/assets/local_icons.dart';
import '../../../constants/size_unit.dart';
import '../../../models/drawer_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../theme/palette.dart';
import '../../../theme/theme_guide.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    List<Menu> drawerList = ProfileMenuData().list(context);
    return CustomScaffold(
      appBar: AppBarCommon(
        title: 'My Profile',
        foregroundColor: Palette.pureWhite,
        backgroundColor: Palette.primary1,
        actions: [
          IconButton(
              onPressed: () => context.push(Routes.updateProfile),
              icon: const Icon(Icons.edit_outlined, color: Palette.pureWhite))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: context.heightFull(),
                  width: context.widthFull(),
                  color: Palette.primary1,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          // InkWell(
                          //   onTap: () => context.push(Routes.updateProfile),
                          // child:
                          ClipRRect(
                              borderRadius: ThemeGuide.borderRadius(),
                              child: const Icon(
                                Icons.account_circle,
                                size: SizeUnit.xlg * 4,
                                color: Color(0xffD9D9D9),
                              )),
                          // ),
                          Consumer<AuthProvider>(
                              builder: (context, value, child) {
                            String name = value.user?.name ?? '';
                            int? id = (value.user?.id ?? '') as int?;
                            return Flexible(
                                child: Column(
                              children: [
                                TextCustom(
                                  name,
                                  size: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Palette.pureWhite,
                                ),
                                TextCustom(
                                  "ID $id",
                                  size: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Palette.pureWhite,
                                ),
                              ],
                            ));
                          })
                        ],
                      ),
                    ),
                  ]),
                ),
                Positioned(
                  top: context.heightQuarter() / 1.5,
                  child: Container(
                    padding: const EdgeInsets.all(SizeUnit.xlg),
                    width: context.widthFull(),
                    height: context.heightFull(),
                    decoration: const BoxDecoration(
                      color: Palette.pureWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(30, 30),
                        topRight: Radius.elliptical(30, 30),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustom(
                              "Orders",
                              size: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        CustomListTile(
                            titleText: "My Orders",
                            onTap: () => context.go(Routes.orders),
                            img: LocalIcons.myorder,
                            subtitleText: ''),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustom(
                              "More",
                              size: 20,
                              //  fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        ...List.generate(drawerList.length, (i) {
                          Menu drawer = drawerList[i];
                          return CustomListTile(
                              color: Palette.dark,
                              titleText: drawer.title,
                              onTap: drawer.onTap,
                              img: drawer.img,
                              subtitleText: '');
                          //   DrawerItem(
                          // title: drawer.title, onTap: drawer.onTap);
                        })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
