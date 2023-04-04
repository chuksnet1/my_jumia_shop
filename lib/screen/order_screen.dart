import 'package:flutter/material.dart';
import 'package:my_jumia_shop/provider/order_data.dart';
import 'package:my_jumia_shop/widget/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = 'Order-Screen';

  @override
  Widget build(BuildContext context) {
    final orderLstn = Provider.of<OrderItem>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('PROCEED TO CHECKOUT'),
      ),
      body: ListView.builder(
          itemCount: orderLstn.item.length,
          itemBuilder: (contex, index) => OrderItemPage(
                orderLstn.item[index],
              )),
    );
  }
}
