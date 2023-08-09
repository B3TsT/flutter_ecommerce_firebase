import '../models/categories_model.dart';
import '../services/assets_manager.dart';

class AppConstants {
  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';
  static List<String> bannersImage = [
    AssetsManager.banner1,
    AssetsManager.banner2,
  ];

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
      id: 'Phones',
      name: 'Phones',
      image: AssetsManager.mobiles,
    ),
    CategoriesModel(
      id: 'Laptops',
      name: 'Laptops',
      image: AssetsManager.pc,
    ),
    CategoriesModel(
      id: 'Electronics',
      name: 'Electronics',
      image: AssetsManager.electronics,
    ),
    CategoriesModel(
      id: 'Watches',
      name: 'Watches',
      image: AssetsManager.watch,
    ),
    CategoriesModel(
      id: 'Clothes',
      name: 'Clothes',
      image: AssetsManager.fashion,
    ),
    CategoriesModel(
      id: 'Shoes',
      name: 'Shoes',
      image: AssetsManager.shoes,
    ),
    CategoriesModel(
      id: 'Books',
      name: 'Books',
      image: AssetsManager.book,
    ),
    CategoriesModel(
      id: AssetsManager.mobiles,
      name: 'Cosmetics',
      image: AssetsManager.cosmetics,
    ),
  ];
}
