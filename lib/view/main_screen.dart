import 'package:bellaryapp/common/widgets/bottom_bar/bottom_bar.dart';
import 'package:bellaryapp/common/widgets/drawer_custom.dart';
import 'package:bellaryapp/constants/keys.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.child});
  final Widget child;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      key: homeKey,
      drawer: const DrawerCustom(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
