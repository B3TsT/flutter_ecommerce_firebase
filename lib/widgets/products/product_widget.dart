import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shops/widgets/subtitle_text.dart';
import 'package:shops/widgets/title_text.dart';

import '../../consts/app_constanst.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        print('ProductWidget');
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: FancyShimmerImage(
              width: double.infinity,
              height: size.height * 0.22,
              imageUrl: AppConstants.imageUrl,
            ),
          ),
          const SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: TitlesTextWidget(
                    label: 'Title ' * 10,
                    fontSize: 18,
                    maxLines: 2,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(IconlyLight.heart),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  flex: 1,
                  child: SubtitleTextWidget(
                    label: '1550.00\$',
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
                Flexible(
                  child: Material(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.lightBlue,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(12.0),
                      splashColor: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}