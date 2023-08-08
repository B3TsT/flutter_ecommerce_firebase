import 'package:flutter/material.dart';
import 'package:shops/services/assets_manager.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

import '../widgets/products/product_widget.dart';
import '../widgets/title_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
          title: const TitlesTextWidget(label: 'Search products'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // setState(() {
                      FocusScope.of(context).unfocus();
                      _searchController.clear();
                      // });
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                  ),
                ),
                onChanged: (value) {},
                onSubmitted: (value) {},
              ),
              const SizedBox(height: 15.0),
              Expanded(
                child: DynamicHeightGridView(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  itemCount: 200,
                  crossAxisCount: 2,
                  builder: (_, index) {
                    return const ProductWidget();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
