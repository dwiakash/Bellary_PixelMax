import 'package:bellaryapp/providers/address_provider.dart';
import 'package:bellaryapp/providers/cancel_confirma_provider.dart';
import 'package:bellaryapp/providers/category_provider.dart';
import 'package:bellaryapp/providers/city_provider.dart';
import 'package:bellaryapp/providers/feedback_provider.dart';
import 'package:bellaryapp/providers/info_provider.dart';
import 'package:bellaryapp/providers/language_provider.dart';
import 'package:bellaryapp/providers/orders_provider.dart';
import 'package:bellaryapp/providers/privacy_provider.dart';
import 'package:bellaryapp/providers/product_provider.dart';
import 'package:bellaryapp/providers/profile_provider.dart';
import 'package:bellaryapp/providers/service_provider.dart';
import 'package:bellaryapp/providers/shop_provider.dart';
import 'package:bellaryapp/providers/view_ProductProvider.dart';
import 'package:flutter/material.dart';

import '/constants/keys.dart';
import '/providers/auth_provider.dart';

import '/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'cancel_booking_provider.dart';
import 'faq_provider.dart';
import 'notification_provider.dart';
import 'onboard_provider.dart';
import 'order_pages_provider.dart';
import 'terms_provider.dart';

/// Declaration for all providers
List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ThemeManager>(create: (context) => ThemeManager()),
  ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
  ChangeNotifierProvider<InfoProvider>(create: (context) => InfoProvider()),
  ChangeNotifierProvider<CategoryProvider>(
      create: (context) => CategoryProvider()),
  ChangeNotifierProvider<CityProvider>(create: (context) => CityProvider()),
  ChangeNotifierProvider<LanguageProvider>(
      create: (context) => LanguageProvider()),
  ChangeNotifierProvider<ShopProvider>(create: (context) => ShopProvider()),
  ChangeNotifierProvider<ServiceProvider>(
      create: (context) => ServiceProvider()),
  ChangeNotifierProvider<ProfileProvider>(
      create: (context) => ProfileProvider()),
  ChangeNotifierProvider<ServiceProvider>(
      create: (context) => ServiceProvider()),
  ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider()),
  ChangeNotifierProvider<OnBoardProvider>(
      create: (context) => OnBoardProvider()),
  ChangeNotifierProvider<TermsProvider>(create: (context) => TermsProvider()),
  ChangeNotifierProvider<PrivacyProvider>(
      create: (context) => PrivacyProvider()),
  ChangeNotifierProvider<FAQProvider>(create: (context) => FAQProvider()),
  ChangeNotifierProvider<OrderConfirmationProvider>(
      create: (context) => OrderConfirmationProvider()),
  ChangeNotifierProvider<OrderProvider>(create: (context) => OrderProvider()),
  ChangeNotifierProvider<CancelconfirmationProvider>(
      create: (context) => CancelconfirmationProvider()),
  ChangeNotifierProvider<NotificationProvider>(
      create: (context) => NotificationProvider()),
  ChangeNotifierProvider<FeedbackProvider>(
      create: (context) => FeedbackProvider()),
  ChangeNotifierProvider<CancelBookingProvider>(
      create: (context) => CancelBookingProvider()),
  ChangeNotifierProvider<ViewProductProvider>(
      create: (context) => ViewProductProvider()),
  ChangeNotifierProvider<LocationProvider>(
      create: (context) => LocationProvider()),
];

var themeManager =
    Provider.of<ThemeManager>(mainKey.currentContext!, listen: false);

var authProvider =
    Provider.of<AuthProvider>(mainKey.currentContext!, listen: false);

var infoProvider =
    Provider.of<InfoProvider>(mainKey.currentContext!, listen: false);

var categoryProvider =
    Provider.of<CategoryProvider>(mainKey.currentContext!, listen: false);

var cityProvider =
    Provider.of<CityProvider>(mainKey.currentContext!, listen: false);

var languageProvider =
    Provider.of<LanguageProvider>(mainKey.currentContext!, listen: false);

var profileProvider =
    Provider.of<ProfileProvider>(mainKey.currentContext!, listen: false);

var shopProvider =
    Provider.of<ShopProvider>(mainKey.currentContext!, listen: false);

var serviceProvider =
    Provider.of<ServiceProvider>(mainKey.currentContext!, listen: false);
var productProvider =
    Provider.of<ProductProvider>(mainKey.currentContext!, listen: false);

var onBoardProvider =
    Provider.of<OnBoardProvider>(mainKey.currentContext!, listen: false);

var termsProvider =
    Provider.of<TermsProvider>(mainKey.currentContext!, listen: false);

var faqProvider =
    Provider.of<FAQProvider>(mainKey.currentContext!, listen: false);

var privacyProvider =
    Provider.of<PrivacyProvider>(mainKey.currentContext!, listen: false);

var orderconfirmationProvider = Provider.of<OrderConfirmationProvider>(
    mainKey.currentContext!,
    listen: false);

var orderProvider =
    Provider.of<OrderProvider>(mainKey.currentContext!, listen: false);

var cancelconfirmationProvider = Provider.of<CancelconfirmationProvider>(
    mainKey.currentContext!,
    listen: false);

var notificationProvider =
    Provider.of<NotificationProvider>(mainKey.currentContext!, listen: false);

var feedbackProvider =
    Provider.of<FeedbackProvider>(mainKey.currentContext!, listen: false);

var cancelBookingProvider =
    Provider.of<CancelBookingProvider>(mainKey.currentContext!, listen: false);

//CancelBookingProvider