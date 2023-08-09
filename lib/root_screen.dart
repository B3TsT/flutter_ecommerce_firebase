import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shops/screens/cart/cart_screen.dart';
import 'package:shops/screens/home_screen.dart';
import 'package:shops/screens/profile_screen.dart';
import 'package:shops/screens/search_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController controller;
  late List<Widget> screens;
  int currentScreen = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentScreen);
    screens = const [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: currentScreen,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 10,
          height: kBottomNavigationBarHeight,
          onDestinationSelected: (index) {
            setState(() {
              currentScreen = index;
            });
            controller.jumpToPage(currentScreen);
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(IconlyBold.home),
              icon: Icon(IconlyLight.home),
              label: "home",
            ),
            NavigationDestination(
              selectedIcon: Icon(IconlyBold.search),
              icon: Icon(IconlyLight.search),
              label: "Search",
            ),
            NavigationDestination(
              selectedIcon: Icon(IconlyBold.bag2),
              icon: Badge(label: Text('5'), child: Icon(IconlyLight.bag2)),
              label: "Cart",
            ),
            NavigationDestination(
              selectedIcon: Icon(IconlyBold.profile),
              icon: Icon(IconlyLight.profile),
              label: "Profile",
            ),
          ]),
    );
  }
}
