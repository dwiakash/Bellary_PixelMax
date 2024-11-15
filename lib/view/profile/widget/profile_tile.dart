import 'package:flutter/material.dart';
import '/common/widgets/list_tile_custom.dart';
import '/constants/size_unit.dart';
import '/theme/theme_guide.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.onTap,
    this.color,
  });
  final String title, subTitle;
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: ThemeGuide.cardDecoration(),
        padding: const EdgeInsets.all(SizeUnit.lg),
        child: CustomListTile(
            color: color, icon: icon, titleText: title, subtitleText: subTitle),
      ),
    );
  }
}
