import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/repositories/auth_repository.dart';
import 'package:bellaryapp/theme/Palette.dart';
import 'package:bellaryapp/view/onboarding/widget/dot_indicator.dart';
import 'package:flutter/material.dart';
import '../../../constants/size_unit.dart';
import '../widget/on_board_content.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController pageController = PageController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => init());
    super.initState();
  }

  void init() {
    onBoardProvider.onBoardData = onBoardProvider.onBoardList[0];
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;
  void onPagechanged(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        //  padding: const EdgeInsets.all(SizeUnit.lg),
        duration: const Duration(milliseconds: 500),
        child: Column(children: [
          Expanded(
            // flex: 6,
            child: PageView.builder(
              onPageChanged: onPagechanged,
              itemCount: onBoardProvider.onBoardList.length,
              controller: pageController,
              itemBuilder: (context, index) => OnBoardContent(
                  data: onBoardProvider.onBoardList[index], pageIndex: index),
            ),
          ),
          // const Spacer(),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  onBoardProvider.onBoardList.length,
                  (i) => DotIndicator(
                      isActive: i == selectedIndex, color: Palette.primary))),
          //  const Spacer(),
          const SizedBox(height: SizeUnit.lg),
          switch (selectedIndex) {
            0 => screen1Button(context),
            _ => screen2Button(context)
          },
          const SizedBox(height: SizeUnit.lg),
        ]),
      ),
    );
  }

  Widget screen1Button(context) {
    return Padding(
      padding: const EdgeInsets.all(SizeUnit.lg),
      child: Column(
        children: [
          Row(children: [
            Expanded(
                child: ButtonPrimary(
                    onPressed: () => pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.linear),
                    label: "Next")),
          ]),
          const HeightHalf(),
          Row(children: [
            Expanded(
                child: ButtonOutlined(
                    onPressed: () => AuthRepository().navigateLogin(context),
                    label: "Skip")),
          ]),
        ],
      ),
    );
  }

  Widget screen2Button(context) {
    return Padding(
      padding: const EdgeInsets.all(SizeUnit.lg),
      child: Row(children: [
        Expanded(
            child: ButtonPrimary(
                onPressed: () => AuthRepository().navigateLogin(context),
                label: "Next")),
      ]),
    );
  }
}

  // ontapNext() {
  //   context.push(Routes.onboard3);
  // }

  // ontapSkip() {
  //   AuthRepository().navigateHome(context);
  // }
 
