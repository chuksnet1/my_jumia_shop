import 'package:flutter/material.dart';
import 'package:my_jumia_shop/model/product_data.dart';
import 'package:my_jumia_shop/provider/cart.dart';
import 'package:my_jumia_shop/provider/product_provider.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

class ProductDetailScreen extends StatelessWidget {
  final DateTime date = DateTime.now();
  static const routeName = 'ProductDetailScreen';

  @override
  Widget build(BuildContext context) {
    final prodId = ModalRoute.of(context)!.settings.arguments as String;
    final detailData = Provider.of<ProductProvider>(context).items.firstWhere(
          (stockId) => stockId.id == prodId,
        );

    final cartInput = Provider.of<cartDummy_Data>(context);
    

    return Scaffold(
      appBar: AppBar(
        title: Text(detailData.title),
      ),
      body: Column(
        children: [
          Container(
            child: detailData.imagePics,
          ),
          SizedBox(height: 15),
          Card(
            margin: EdgeInsets.all(10),
            child: Text(
              detailData.description,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            color: Colors.red.shade600,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Flash Sales',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                Text(
                  'Start on: ${DateFormat.yMEd().format(date)}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'PRICE:  \$${detailData.amount}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.home,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.15,
                  color: Colors.orange,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.call),
                  ),
                  width: MediaQuery.of(context).size.width * 0.15,
                  color: Colors.orange,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 50,
                  color: Color.fromARGB(255, 255, 153, 0),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () =>  cartInput.addCartItem(      
                               detailData.id,
                                detailData.amount,
                                detailData.title,
                                
                              ),
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          )),
                      Text(
                        'ADD TO CART',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
