import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:shop/provider/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  const OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _animationController,
              ),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                  _expanded
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(
                widget.order.products.length * 40.0 + 10,
                180,
              ),
              //duration: Duration(microseconds: 200),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: ListView(
                  children: widget.order.products
                      .map(
                        (product) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${product.quantity} x \$${product.price}',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            )
        ],
      ),
    );
  }
}
