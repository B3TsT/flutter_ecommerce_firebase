import 'package:flutter/material.dart';
import 'package:shops/services/assets_manager.dart';
import 'package:shops/widgets/empty_bag.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmptyBagWidget(
        imagePath: AssetsManager.shoppingBasket,
        title: 'Your cart is empty!',
        subtitle: 'Looks Like your is empty add something and make me happy',
        buttonLabel: 'Shop now',
      ),
    );
  }
}
