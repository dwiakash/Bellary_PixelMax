import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/common/widgets/dropdown.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/models/auth_user.dart';
import 'package:bellaryapp/models/lanugage.dart';
import 'package:bellaryapp/providers/language_provider.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/repositories/language_repository.dart';
import 'package:bellaryapp/utilities/extensions/form_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../common/widgets/appbars/appbar_common.dart';
import '../../../constants/size_unit.dart';
import '../../../services/route/routes.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool get pushCompleteProfile =>
      (GoRouterState.of(context).extra ?? false) as bool;

  Language? selectedLanguage;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((t) => initialize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, value, child) => CustomScaffold(
        appBar: const AppBarCommon(title: "Choose your Language"),
        bottomBar: Padding(
          padding: const EdgeInsets.all(SizeUnit.lg),
          child: ButtonPrimary(
              onPressed: onSubmit,
              isLoading: value.isLoading,
              label: 'Continue'),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(SizeUnit.lg),
              child: Column(
                children: [
                  DropDownCustom(
                      value: selectedLanguage,
                      labelText: 'Select your language',
                      items: value.languages
                          .map((e) => DropdownMenuItem(
                              value: e, child: TextCustom(e.name ?? '')))
                          .toList(),
                      onChanged: onSelectLanguage),
                  // Dropdowncustomstyle(
                  //   selectedvalue: selectedCity,
                  //   data: AppStrings.citylist,
                  //   //nav: Routes.language,
                  // ),
                ],
              )),
        ),
      ),
    );
  }

  void onSelectLanguage(Language? language) {
    selectedLanguage = language;
    setState(() {});
  }

  void onSubmit() async {
    if (formKey.hasError) return;
    Language? language = selectedLanguage;
    bool isUpdated =
        await LanguageRepository().updateLanguage(context, language!);
    if (!isUpdated) return;
    AuthUser? user = authProvider.user;
    authProvider.user = user?.copyWith(
        profile: user.profile?.copyWith(languageId: language.id));
    if (pushCompleteProfile) {
      context.push(Routes.setupprofile);
      return;
    }
    context.pop();
  }

  void initialize() async {
    int id = authProvider.user?.profile?.languageId ?? -1;
    selectedLanguage =
        languageProvider.languages.where((e) => e.id == id).toList().firstOrNull;
    setState(() {});
  }
}
