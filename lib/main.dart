import 'package:flutter/material.dart';
import 'package:my_jumia_shop/model/product_data.dart';
import 'package:my_jumia_shop/provider/cart.dart';
import 'package:my_jumia_shop/provider/order_data.dart';
import 'package:my_jumia_shop/provider/product_provider.dart';
import 'package:my_jumia_shop/screen/cart_screen.dart';
import 'package:my_jumia_shop/screen/order_screen.dart';
import 'package:my_jumia_shop/screen/product_detail_screen.dart';

import 'package:my_jumia_shop/screen/product_overview.dart';
import 'package:my_jumia_shop/widget/product_item.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => cartDummy_Data(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderItem(),)
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.orange,
        ),
        home: ProductOverview(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName:(context) => CartScreen(),
          OrderScreen.routeName : (context) => OrderScreen(),
          
        },
      ),
    );
  }
}
