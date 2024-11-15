import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:provider/provider.dart';
import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/assets/local_images.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/providers/info_provider.dart';
import 'package:bellaryapp/repositories/info_repository.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Consumer<InfoProvider>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(SizeUnit.lg * 2),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(LocalImages.noSignal),
                  const HeightFull(multiplier: 3),
                  const TextCustom(
                    'No Connection',
                    size: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  const HeightFull(),
                  const TextCustom(
                      "No Internet connection found.Check your connection or try again",
                      align: TextAlign.center,
                      color: Palette.secondary,
                      fontWeight: FontWeight.bold,
                      height: 1.6,
                      size: 14),
                  const HeightFull(multiplier: 3),
                  ButtonPrimary(
                    onPressed: () => InfoRepository()
                        .checkInternetConnection(isManualCheck: true),
                    label: 'TRY AGAIN',
                    isLoading: value.isCheckingInternet,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
