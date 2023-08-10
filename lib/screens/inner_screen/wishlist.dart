import 'package:flutter/material.dart';
import 'package:shops/screens/cart/cart_widget.dart';
import 'package:shops/services/assets_manager.dart';
import 'package:shops/widgets/empty_bag.dart';
import 'package:shops/widgets/title_text.dart';

import '../cart/bottom_checkout.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  const WishlistScreen({super.key});
  final bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.bagWish,
              title: 'Nothing in ur wishlist yet',
              subtitle:
                  'Looks Like your is empty add something and make me happy',
              buttonLabel: 'Shop now',
            ),
          )
        : Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsManager.shoppingCart),
              ),
              title: const TitlesTextWidget(label: 'Wishlist (6)'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const CartWidget();
              },
            ),
            bottomSheet: const CartBottomSheetWidget(),
          );
  }
}
