import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shops/screens/inner_screen/viewed_recently.dart';
import 'package:shops/services/assets_manager.dart';
import 'package:shops/widgets/app_name_text.dart';
import 'package:shops/widgets/subtitle_text.dart';

import '../providers/theme_provider.dart';
import '../services/my_app_functions.dart';
import '../widgets/title_text.dart';
import 'inner_screen/wishlist.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getIsDarkTheme = context.watch<ThemeProvider>().getIsDarkTheme;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
        title: const AppNameTextWidget(fontSize: 20),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Visibility(
              visible: false,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: TitlesTextWidget(
                    label: 'Please login to have unlimited access'),
              ),
            ),
            Visibility(
              visible: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.background,
                          width: 3,
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), // 20
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitlesTextWidget(label: 'Hadi Kachmar'),
                          SizedBox(height: 6),
                          SubtitleTextWidget(
                              label: 'Coding.with.hadi@gmail.com')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(height: 10),
                  const TitlesTextWidget(label: 'General'),
                  const SizedBox(height: 10),
                  CustomListTitle(
                    text: 'All orders',
                    imagePath: AssetsManager.orderSvg,
                    function: () {},
                  ),
                  CustomListTitle(
                      text: 'Wishlist',
                      imagePath: AssetsManager.wishlistSvg,
                      function: () => Navigator.pushNamed(
                            context,
                            WishlistScreen.routeName,
                          )),
                  CustomListTitle(
                      text: 'Viewed recently',
                      imagePath: AssetsManager.recent,
                      function: () => Navigator.pushNamed(
                            context,
                            ViewedRecenctlyScreen.routeName,
                          )),
                  CustomListTitle(
                    text: 'Address',
                    imagePath: AssetsManager.address,
                    function: () {},
                  ),
                  const SizedBox(height: 6),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(height: 6),
                  const TitlesTextWidget(label: 'Settings'),
                  const SizedBox(height: 10),
                  SwitchListTile(
                    secondary: Image.asset(
                      AssetsManager.theme,
                      height: 34,
                    ),
                    title: Text(getIsDarkTheme ? 'Dark Mode' : 'Light Mode'),
                    value: getIsDarkTheme,
                    onChanged: (value) {
                      context.read<ThemeProvider>().setDarkTheme(value);
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () async {
                  await MyAppFunctions.showErrorOrWarningDialog(
                      context: context,
                      fct: () {},
                      subTitle: "Are you sure you want to signout",
                      isError: false);
                },
                icon: const Icon(Icons.login),
                label: const Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,
  });
  final String imagePath, text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => function(),
      title: SubtitleTextWidget(label: text),
      leading: Image.asset(
        imagePath,
        height: 34,
      ),
      trailing: const Icon(
        IconlyLight.arrowRight2,
        size: 15,
      ),
    );
  }
}
