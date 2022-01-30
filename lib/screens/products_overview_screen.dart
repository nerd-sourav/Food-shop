import 'package:flutter/material.dart';
import 'package:shop/widgets/products_grid.dart';

class ProductOverViewScreen extends StatelessWidget {
  const ProductOverViewScreen({Key? key}) : super(key: key);
  static const routeName = '/overview-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black.withAlpha(800),
      appBar: AppBar(
        title: const Text('My Shop'),
      ),
      body: ProductsGrid(),
    );
  }
}
