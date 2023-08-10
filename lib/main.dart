import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shops/root_screen.dart';

import 'consts/app_theme_data.dart';
import 'providers/theme_provider.dart';
import 'screens/inner_screen/product_details.dart';
import 'screens/inner_screen/viewed_recently.dart';
import 'screens/inner_screen/wishlist.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'ShopSmart EN',
          theme: Styles.themeData(
            isDarkTheme: themeProvider.getIsDarkTheme,
            context: context,
          ),
          home: const RootScreen(),
          routes: {
            ProductDetailsScreen.routeName: (context) =>
                const ProductDetailsScreen(),
            WishlistScreen.routeName: (context) => const WishlistScreen(),
            ViewedRecenctlyScreen.routeName: (context) =>
                const ViewedRecenctlyScreen(),
          },
        );
      }),
    );
  }
}
