// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/cart.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/widgets/badge.dart';

import 'package:shop/widgets/products_grid.dart';

enum FilterOptions {
  Favoutite,
  All,
}

class ProductOverViewScreen extends StatefulWidget {
  const ProductOverViewScreen({Key? key}) : super(key: key);
  static const routeName = '/overview-screen';

  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  var _showOnlyFavourite = false;
  @override
  Widget build(BuildContext context) {
    //final productContainer = Provider.of<Products>(context, listen: false);
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      //backgroundColor: Colors.black.withAlpha(800),
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favoutite) {
                  _showOnlyFavourite = true;
                } else {
                  _showOnlyFavourite = false;
                }
              });

              //transfering the value to the body;
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                  child: Text('Only Favourites'),
                  value: FilterOptions.Favoutite),
              const PopupMenuItem(
                  child: Text('Show All'), value: FilterOptions.All),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
              ),
              value: cart.itemCount.toString(),
              color: Colors.orange,
            ),
          ),
        ],
      ),
      body: ProductsGrid(showFavs: _showOnlyFavourite),
    );
  }
}
