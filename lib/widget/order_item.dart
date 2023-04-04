
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_jumia_shop/provider/order_data.dart';
import 'package:intl/intl.dart';

class OrderItemPage extends StatefulWidget {
  final Order order;

  OrderItemPage(this.order);

  @override
  State<OrderItemPage> createState() => _OrderItemPageState();
}

class _OrderItemPageState extends State<OrderItemPage> {
  var _expanded = false;

  @override
  Widget build(BuildContext contex) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: Text(
              'Total :  \$${widget.order.amount}         ',
            ),
            title: Text(DateFormat.MEd().format(widget.order.dateOrder)),
            subtitle: Text(DateFormat.EEEE().format(DateTime.now())),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_more : Icons.expand_less),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if(_expanded)
          Container(
            margin: EdgeInsets.all(10),
            height: min(widget.order.Product.length * 20.0 + 50, 100),
            child: ListView(children: [
              ...widget.order.Product.map((e) {
                return Row(children: [
                  Container(
                    height: 20,
                    width: 140,
                    child: Text(e.title),),
                  SizedBox(width: 15,),
                  Text('${e.quantity.toString()} x '),
                  Text(e.price.toString()),
                  SizedBox(width:10),
                  Card(child: Text('    = ${e.quantity * e.price}'))
                ],);
              }).toList(),
            ], ),)
        ],
      ),
    );
  }
}
