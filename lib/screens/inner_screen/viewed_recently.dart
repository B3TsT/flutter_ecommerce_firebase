import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shops/services/assets_manager.dart';
import 'package:shops/widgets/empty_bag.dart';
import 'package:shops/widgets/title_text.dart';

import '../../widgets/products/product_widget.dart';

class ViewedRecenctlyScreen extends StatelessWidget {
  static const routeName = '/ViewedRecenctlyScreen';
  const ViewedRecenctlyScreen({super.key});
  final bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.orderBag,
              title: 'No viewed products yet',
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
              title: const TitlesTextWidget(label: 'Viewed recently (6)'),
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
            body: DynamicHeightGridView(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemCount: 200,
              crossAxisCount: 2,
              builder: (_, index) {
                return const ProductWidget();
              },
            ),
          );
  }
}
