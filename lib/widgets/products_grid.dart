import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop/provider/products.dart';
import 'package:shop/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  const ProductsGrid({
    Key? key,
    required this.showFavs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //provider sets up a direct communication channel btwn the listiners;
    // procider can only be added whose parent class is directly or indirectly
    // connected to the Provider i.e ChangeNotifierProvider in main.dart file

    final productsData = Provider.of<Products>(context);
    final products =
        showFavs ? productsData.favouriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
            value: products[index], child: const ProductItem()
            // id: products[index].id,
            // title: products[index].title,
            // imageUrl: products[index].imageUrl,

            );
      },
    );
  }
}
