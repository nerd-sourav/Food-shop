import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details-screen';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //catching the data thrown by the productitem page
    var productDetails = ModalRoute.of(context)?.settings.arguments as String;

    //getting the data using only the ID's of the product
    //using state management system

    return Scaffold(
      appBar: AppBar(
        title: Text(productDetails),
      ),
    );
  }
}
