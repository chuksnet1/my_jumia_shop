import 'package:flutter/material.dart';
import 'package:my_jumia_shop/model/product_data.dart';
import 'package:my_jumia_shop/provider/cart.dart';
import 'package:my_jumia_shop/provider/order_data.dart';
import 'package:my_jumia_shop/widget/app_drawer.dart';
import 'package:my_jumia_shop/widget/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'Cart-Screen';
  @override
  Widget build(BuildContext context) {
    final cartInfo = Provider.of<cartDummy_Data>(context);

    return Scaffold(
      appBar: AppBar(actions: [Drawer()]),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(margin: EdgeInsets.all(10), child: Text('TOTAL')),
                Card(
                  color: Colors.blue,
                  child: Text(
                    cartInfo.totalAmount.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                TextButton(
                  onPressed: 
                  () {
                    //Here we take data from cart and add it to order-data 
                    Provider.of<OrderItem>(context, listen: false).addOrder(
                      cartInfo.cartItem.values.toList(),
                      cartInfo.totalAmount,
                    );
                    cartInfo.cartClear();
                  } ,
                  child: Text('ORDER NOW'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: cartInfo.cartItem.length,
              itemBuilder: (context, index) => CartItem(
                cartInfo.cartItem.values.toList()[index].id,
                cartInfo.cartItem.values.toList()[index].id,
                    cartInfo.cartItem.values.toList()[index].price,
                    cartInfo.cartItem.values.toList()[index].quantity,
                    cartInfo.cartItem.values.toList()[index].title,
                  )),)
        ],
      ),
    );
  }
}
