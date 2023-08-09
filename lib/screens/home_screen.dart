import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shops/consts/app_constanst.dart';
import 'package:shops/services/assets_manager.dart';
import 'package:shops/widgets/app_name_text.dart';
import 'package:shops/widgets/products/ctg_rounded_widget.dart';
import 'package:shops/widgets/products/latest_arrival.dart';
import 'package:shops/widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
        title: const AppNameTextWidget(fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              SizedBox(
                height: size.height * 0.25,
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(50.0),
                  child: Swiper(
                    autoplay: true,
                    itemCount: AppConstants.bannersImage.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        AppConstants.bannersImage[index],
                        fit: BoxFit.fill,
                      );
                    },
                    pagination: const SwiperPagination(
                        // alignment: Alignment.center,
                        builder: DotSwiperPaginationBuilder(
                            activeColor: Colors.red, color: Colors.grey)),
                    // control: const SwiperControl(),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const TitlesTextWidget(label: 'Latest arrival'),
              const SizedBox(height: 15),
              SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return const LatestArrivalProductsWidget();
                  },
                ),
              ),
              const SizedBox(height: 15),
              const TitlesTextWidget(label: 'Categories'),
              const SizedBox(height: 15),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children:
                    List.generate(AppConstants.categoriesList.length, (index) {
                  return CategoryRoundedWidget(
                    image: AppConstants.categoriesList[index].image,
                    name: AppConstants.categoriesList[index].name,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
