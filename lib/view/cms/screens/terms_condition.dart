import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/appbars/appbar_common.dart';
import '../../../providers/providers.dart';
import '../../../providers/terms_provider.dart';
import '../../cms/widget/appbar_extended.dart';

class Termsandcondition extends StatefulWidget {
const Termsandcondition({super.key});

  @override
  State<Termsandcondition> createState() => _TermsandconditionState();
}

class _TermsandconditionState extends State<Termsandcondition> {
  String? data;

  void init() {
    termsProvider.termsData = termsProvider.termslist[0];
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
          title: "Terms and Condition",
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
                itemCount: TermsProvider().termslist.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextCustom(
                            termsProvider.termslist[index].title.toString(),
                            maxLines: 2,
                            size: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const HeightHalf(),
                    ...List.generate(
                        termsProvider.termslist[index].desc!.length, (i) {
                      return TextCustom(
                          termsProvider.termslist[index].desc![i]);
                    }),
                  ]);
                },
              ),
            ],
          ),
        ));
  }
}
