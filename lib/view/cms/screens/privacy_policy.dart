import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/providers/privacy_provider.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/appbars/appbar_common.dart';
import '../../../providers/providers.dart';
import '../widget/appbar_extended.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  String? data;

  void init() {
    privacyProvider.privacyData = privacyProvider.privacylist[0];
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: const AppBarCommon(
          title: "Privacy Policy",
          backgroundColor: Palette.primary,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Appbarcontainer(),
              ListView.separated(
                padding: const EdgeInsets.all(SizeUnit.lg),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return const HeightFull();
                },
                itemCount: PrivacyProvider().privacylist.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextCustom(
                            PrivacyProvider()
                                .privacylist[index]
                                .title
                                .toString(),
                            maxLines: 2,
                            size: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const HeightHalf(),
                    ...List.generate(
                        PrivacyProvider().privacylist[index].desc!.length, (i) {
                      return TextCustom(
                          PrivacyProvider().privacylist[index].desc![i]);
                    }),
                  ]);
                },
              ),
            ],
          ),
        ));
  }
}
