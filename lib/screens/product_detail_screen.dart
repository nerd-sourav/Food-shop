import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details-screen';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //catching the data thrown by the productitem page
    var productID = ModalRoute.of(context)?.settings.arguments as String;

    //getting the data using only the ID's of the product
    //using state management system

    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productID);

    return Scaffold(
        appBar: AppBar(
          title: Text(loadedProduct.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Image.network(loadedProduct.imageUrl),
              )
            ],
          ),
        ));
  }
}
