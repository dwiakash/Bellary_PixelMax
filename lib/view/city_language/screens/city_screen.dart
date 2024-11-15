import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/common/widgets/dropdown.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/models/auth_user.dart';
import 'package:bellaryapp/models/city.dart';
import 'package:bellaryapp/providers/city_provider.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/repositories/city_repository.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/utilities/extensions/form_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../common/widgets/appbars/appbar_common.dart';
import '../../../constants/size_unit.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  bool get canPop => (GoRouterState.of(context).extra ?? true) as bool;
  City? selectedCity;
  final cityformKey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((t) => initialize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CityProvider>(
      builder: (context, city, child) => 
      CustomScaffold(
        isLoading: city.isGettingCities,
        appBar: AppBarCommon(
            automaticLeadingImplies: canPop, title: "Select your city"),
        bottomBar: Padding(
          padding: const EdgeInsets.all(SizeUnit.lg),
          child: ButtonPrimary(
              onPressed: onSubmit,
              isLoading: city.isLoading,
              label: 'Continue'),
        ),
        body: Form(
          key: cityformKey,
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(SizeUnit.lg),
              child: Column(
                children: [
                  DropDownCustom(
                      value: selectedCity,
                      labelText: 'Select your city',
                      items: city.cities
                          .map((e) => DropdownMenuItem(
                              value: e, child: TextCustom(e.name ?? '')))
                          .toList(),
                      onChanged: onSelectCity),
                ],
              )),
        ),
      ),
    );
  }

  void onSelectCity(City? city) {
    selectedCity = city;
    setState(() {});
  }

  void onSubmit() async {
    if (cityformKey.hasError) return;
    City? city = selectedCity;
    bool isUpdated = await CityRepository().updateCity(context, city!);
    if (!isUpdated) return;
    AuthUser? user = authProvider.user;
    authProvider.user =
        user?.copyWith(profile: user.profile?.copyWith(cityId: city.id));
    if (canPop) {
      context.pop();
      return;
    }
    context.push(Routes.language, extra: true);
  }

  void initialize() async {
    int id = authProvider.user?.profile?.cityId ?? -1;
    selectedCity =
        cityProvider.cities.where((e) => e.id == id).toList().firstOrNull;
    setState(() {});
  }
}
