import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/orders.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (BuildContext context, int index) {
          return Text("sdsa");
        },
      ),
    );
  }
}
