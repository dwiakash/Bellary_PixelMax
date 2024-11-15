import 'package:bellaryapp/providers/view_ProductProvider.dart';
import 'package:bellaryapp/view/Cart/address_Screen.dart';
import 'package:bellaryapp/view/Cart/cart_Screen.dart';
import 'package:bellaryapp/view/Cart/view_ProductScreen.dart';
import 'package:bellaryapp/view/Notification/NotificationScreen.dart';
import 'package:bellaryapp/view/Cart/bill_Summry.dart';
import 'package:bellaryapp/view/cms/screens/help_support.dart';
import 'package:bellaryapp/view/cms/screens/faq.dart';
import 'package:bellaryapp/view/cms/screens/about_us.dart';
import 'package:bellaryapp/view/cms/screens/terms_condition.dart';
import 'package:bellaryapp/view/onboarding/screens/welcome_screen.dart';
import 'package:bellaryapp/view/auth/screens/forgot_password_otp_screen.dart';
import 'package:bellaryapp/view/auth/screens/forgot_password_screen.dart';
import 'package:bellaryapp/view/auth/screens/login_screen.dart';
import 'package:bellaryapp/view/auth/screens/register_screen.dart';
import 'package:bellaryapp/view/auth/screens/reset_password_screen.dart';
import 'package:bellaryapp/view/auth/screens/create_password_screen.dart';
import 'package:bellaryapp/view/auth/screens/splash_screen.dart';
import 'package:bellaryapp/view/order_screen/screens/booking_reschedule.dart';
import 'package:bellaryapp/view/order_screen/screens/cancel_booking.dart';
import 'package:bellaryapp/view/order_screen/screens/cancel_confirmation.dart';
import 'package:bellaryapp/view/order_screen/screens/order_confirmation.dart';
import 'package:bellaryapp/view/order_screen/screens/order_pages.dart';

import 'package:bellaryapp/view/product_category/screens/product_category_screen.dart';
import 'package:bellaryapp/view/city_language/screens/city_screen.dart';
import 'package:bellaryapp/view/city_language/screens/language_screen.dart';
import 'package:bellaryapp/view/home/screens/home_screen.dart';
import 'package:bellaryapp/view/main_screen.dart';
import 'package:bellaryapp/view/profile/screens/update_profile_screen.dart';
import 'package:bellaryapp/view/profile/screens/profile_screen.dart';
import 'package:bellaryapp/view/profile/screens/complete_profile.dart';
import 'package:bellaryapp/view/service/screens/service_list_screen.dart';
import 'package:bellaryapp/view/service/screens/service_screen.dart';
import 'package:bellaryapp/view/service_category/screens/service_category_screen.dart';
import 'package:bellaryapp/view/shop/screens/local_shops_screen.dart';
import 'package:bellaryapp/view/shop/screens/shop_detail_screen.dart';
import 'package:bellaryapp/view/shopping/screens/product_list_screen.dart';
import 'package:bellaryapp/view/shopping/screens/shopping_screen.dart';
import 'package:flutter/material.dart';
import '../../view/cms/screens/privacy_policy.dart';
import '../../view/onboarding/screens/onboard_screen.dart';
import '/services/route/route_transition.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
bool isInitialized = false;
bool isOnBoarded = false;
bool isLoggedIn = false;

// GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation: Routes.home,
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        return NoTransitionPage(child: MainScreen(child: child));
      },
      routes: [
        customShellRoute(path: Routes.home, child: const HomeScreen()),
        customShellRoute(path: Routes.service, child: const ServiceScreen()),
        customShellRoute(path: Routes.shopping, child: const ShoppingScreen()),
        customShellRoute(
            path: Routes.localShops, child: const LocalShopsScreen()),
        customShellRoute(path: Routes.orders, child: const OrderScreen()),
      ],
    ),

    ///Onboard
    customRoute(path: Routes.splash, child: const SplashScreen()),
    customRoute(path: Routes.welcome, child: const WelcomeScreen()),
    customRoute(path: Routes.onboard, child: const OnboardScreen()),

    ///Authentication
    customRoute(path: Routes.login, child: const LoginScreen()),
    customRoute(path: Routes.register, child: const RegisterScreen()),

    ///Password
    customRoute(
        path: Routes.forgotPassword, child: const ForgotPasswordScreen()),
    customRoute(
        path: Routes.forgotPasswordOTP, child: const ForgotPasswordOTPScreen()),
    customRoute(path: Routes.resetPassword, child: const ResetPasswordScreen()),
    customRoute(
        path: Routes.createPassword, child: const CreatePasswordScreen()),

    ///Shops
    customRoute(path: Routes.shopDetail, child: const ShopDetailScreen()),

    ///Category
    customRoute(
        path: Routes.productCategory, child: const ProductCategoryScreen()),
    customRoute(
        path: Routes.serviceCategory, child: const ServiceCategoryScreen()),

    ///Service list
    customRoute(path: Routes.serviceList, child: const ServiceListScreen()),

    ///Product list
    customRoute(path: Routes.productList, child: const ProductListScreen()),

    ///Profile
    customRoute(path: Routes.updateProfile, child: const UpdateProfileScreen()),
    customRoute(path: Routes.setupprofile, child: const Setupprofile()),
    customRoute(path: Routes.city, child: const CityScreen()),
    customRoute(path: Routes.language, child: const LanguageScreen()),
    customRoute(path: Routes.profile, child: const ProfileScreen()),

    ///CMS
    customRoute(path: Routes.terms, child: const Termsandcondition()),
    customRoute(path: Routes.faq, child: const FAQscreen()),
    customRoute(path: Routes.help, child: const HelpAndSupport()),
    customRoute(path: Routes.about, child: const Aboutus()),
    customRoute(path: Routes.privacy, child: const Privacy()),

    ///Orders
    // customRoute(path: Routes.orders, child: const OrderScreen()),
    customRoute(
        path: Routes.orderconfirmation, child: const OrderConfirmationPage()),

    ///cancel
    customRoute(path: Routes.cancelbooking, child: const CancelBookingPage()),
    customRoute(
        path: Routes.cancelconfirmation, child: const CancelConfirmation()),

    //Cart Section
    customRoute(path: Routes.viewProductScreen, child: ViewProductScreen()),
    customRoute(path: Routes.cartScreen, child: CartScreen()),
    customRoute(path: Routes.addressScreen, child: AddressScreen()),
    customRoute(path: Routes.billSummry, child: BillSummary()),

    ///reschedule
    customRoute(
        path: Routes.bookingreschdule, child: const BookingReschedule()),
    customRoute(path: Routes.notification, child: NotificationScreen()),
  ],
  redirect: (context, state) {
    String path = state.uri.path;
    if (!isInitialized) return Routes.viewProductScreen;
    // logger.e(!isOnBoarded && path != Routes.onboard);
    if (!isOnBoarded) {
      if (path == Routes.onboard) return null;
      return Routes.welcome;
    }
    bool canLogin = path != Routes.register &&
        path != Routes.forgotPassword &&
        path != Routes.forgotPasswordOTP;
    if (!isLoggedIn && canLogin) return Routes.login;

    return null;
  },
);

GoRoute customShellRoute({required String path, required Widget child}) {
  return GoRoute(
      path: path,
      parentNavigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state) => NoTransitionPage(child: child));
}

GoRoute customRoute({required String path, required Widget child}) {
  return GoRoute(
      path: path,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => CustomTransitionPage(
          child: child,
          transitionsBuilder:
              RouteTransition(direction: TransitionDirection.left).slide));
}
