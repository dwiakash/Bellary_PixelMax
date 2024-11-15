import 'package:bellaryapp/repositories/auth_repository.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/assets/local_icons.dart';

class Menu {
  final String title;
  final VoidCallback onTap;
  IconData? icon;
  String? img;
  Menu({required this.title, required this.onTap, this.icon, this.img});
}

class DrawerData {
  List<Menu> list(BuildContext context) => [
        Menu(title: 'View Profile', onTap: () => context.push(Routes.profile)),
        Menu(
            title: 'My Orders',
            onTap: () {
              context.go(Routes.orders);
            }),
        Menu(title: 'Cart', onTap: () {}),
        Menu(
            title: 'Local Shops & Offers',
            onTap: () {
              context.go(Routes.localShops);
            }),
        Menu(
            title: 'Services',
            onTap: () {
              context.go(Routes.service);
            }),
        Menu(title: 'Shopping', onTap: () {}),
        Menu(
            title: 'Change Language',
            onTap: () => context.push(Routes.language)),
        Menu(
            title: 'About Us',
            onTap: () {
              context.push(Routes.about);
            }),
        Menu(
            title: 'Help & Support',
            onTap: () {
              context.push(Routes.help);
            }),
        Menu(
            title: 'Terms & Conditions',
            onTap: () {
              context.push(Routes.terms);
            }),
        Menu(
            title: 'Privacy Policy',
            onTap: () {
              context.push(Routes.privacy);
            }),
        Menu(
            title: 'FAQ',
            onTap: () {
              context.push(Routes.faq);
            }),
        Menu(title: 'Logout', onTap: () => AuthRepository().logOut(context)),
      ];
}

class ProfileMenuData {
  List<Menu> list(BuildContext context) => [
        Menu(
            title: "Home",
            onTap: () => context.go(Routes.home),
            //  icon: Icons.language_outlined,
            img: LocalIcons.home),
        Menu(
            title: "Change Language",
            onTap: () => context.push(Routes.language),
            //  icon: Icons.language_outlined,
            img: LocalIcons.location),
        Menu(
            // icon: Icons.location_on_outlined,
            img: LocalIcons.language,
            title: 'Change Location',
            onTap: () {
              context.push(Routes.city);
            }),
        Menu(
            title: 'Change Password',
            img: LocalIcons.password,
            onTap: () {
              //      AuthRepository().forgotPassword(context, creds)
              context.push(Routes.resetPassword);
            }),
        Menu(
          title: 'Logout',
          img: LocalIcons.logout,
          onTap: () => AuthRepository().logOut(context),
          // icon: Icons.logout_outlined,
        ),
      ];
}
