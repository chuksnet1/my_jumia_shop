import 'package:flutter/material.dart';
import 'package:my_jumia_shop/provider/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String prodId;
  final String id;
  final String title;
  final double amount;
  final int quantity;

  CartItem(this.prodId,this.id, this.amount,  this.quantity,  this.title);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(child: Icon(
          Icons.delete,
          color: Colors.red,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),),
        direction: DismissDirection.endToStart,
        onDismissed: (direction){
          Provider.of<cartDummy_Data>(context, listen: false).removeCartItem(id);
        },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(4),
        color: Colors.grey.shade300,
        child: ListTile(
          leading: Text(amount.toString()),
          title: Text(title),
          subtitle: Text('$quantity x'),
          trailing: Text('${quantity * amount}' ),
        ),
      ),
    );
  }
}
