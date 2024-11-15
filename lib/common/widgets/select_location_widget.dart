import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/models/city.dart';
import 'package:bellaryapp/providers/city_provider.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SelectLocationWidget extends StatelessWidget {
  const SelectLocationWidget({
    super.key,
    this.color,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Consumer<CityProvider>(
      builder: (context, city, child) {
        int id = authProvider.user?.profile?.cityId ?? -1;
        City? selectedCity =
            city.cities.where((e) => e.id == id).toList().firstOrNull;
        return TextButton.icon(
            onPressed: () => context.push(Routes.city),
            iconAlignment: IconAlignment.end,
            icon: Icon(
              Icons.arrow_drop_down,
              color: color ?? Palette.dark,
            ),
            label: TextCustom(
              selectedCity?.name ?? 'Select City',
              maxLines: 1,
              align: TextAlign.start,
              color: color ?? Palette.dark,
              size: 16,
              fontWeight: FontWeight.w700,
            ));
      },
    );
  }
}
