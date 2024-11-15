import 'package:bellaryapp/constants/assets/local_icons.dart';
import 'package:bellaryapp/services/route/routes.dart';

class BottomBarData {
  List<BottomBarDatum> data = [
    BottomBarDatum(title: 'Home', image: LocalIcons.home, route: Routes.home),
    BottomBarDatum(
        title: 'Orders', image: LocalIcons.orders, route: Routes.orders),
    BottomBarDatum(
        title: 'Local Shops', image: LocalIcons.shop, route: Routes.localShops),
    BottomBarDatum(
        title: 'Services', image: LocalIcons.services, route: Routes.service),
    BottomBarDatum(
        title: 'Shopping', image: LocalIcons.shopping, route: Routes.shopping),
  ];
}

class BottomBarDatum {
  final String image, title, route;

  BottomBarDatum({this.image = '', required this.title, required this.route});
}
