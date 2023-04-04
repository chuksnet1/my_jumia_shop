import 'package:flutter/material.dart';
import 'package:my_jumia_shop/screen/cart_screen.dart';

import 'package:my_jumia_shop/widget/moving_container.dart';
import 'package:my_jumia_shop/widget/product_item.dart';
import '../widget/custom_search.dart';

import '../provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductLsn = Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        actions: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              color: Color.fromARGB(255, 241, 239, 239),
              borderRadius: BorderRadius.circular(20)
            ),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(5),
            width: 300,
            child: Row(
              children: [
                IconButton(
                    //color: Colors.white,
                    alignment: Alignment.center,
                    onPressed: () {
                      showSearch(context: context, delegate: CustomSearch());
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
                TextButton(
                    onPressed: () =>
                        showSearch(context: context, delegate: CustomSearch()),
                    child: Text(
                      'Search for your groceries',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
        // title: Text('My JumIA DEMO'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.orange.shade200,
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Text(
                'TO ORDER CALL:  O80344413378',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            MovingContainer(),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
              color: Colors.grey.shade300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 150,
                    child: Text(
                      'Still Available',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (_) => [
                      PopupMenuItem(child: Text('Only Favourite'), value: 0),
                      PopupMenuItem(child: Text('OShow Al1'), value: 1),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.all(10),
                color: Colors.amber,
                height: 280,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: 6,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => ProductItem(
                    amount: ProductLsn.Dummy_Product[index].amount,
                    id: ProductLsn.Dummy_Product[index].id,
                    magePic: ProductLsn.Dummy_Product[index].imagePics,
                    title1: ProductLsn.Dummy_Product[index].title,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
