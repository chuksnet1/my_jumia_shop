import 'package:flutter/material.dart';

import '../model/product_data.dart';

class ProductProvider with ChangeNotifier {
  final Dummy_Product = [
    ProductData(
      amount: 102.0,
      description: 'a very lovely phone, fast and easy to use',
      id: 'p1',
      imagePics: Image.asset('asset/image/camon.jpeg'),
      title: 'Techno Camon 20',
      
    ),
    ProductData(
      amount: 220.0,
      description: 'you can regret your step',
      id: 'p2',
      imagePics: Image.asset('asset/image/ao3s.jpeg'),
      title: 'Samsung A30s',
    ),
    ProductData(
      amount: 1410.0,
      description: 'design wey pass design',
      id: 'p3',
      imagePics: Image.asset('asset/image/gucci.jpeg'),
      title: 'Gucci Alvano Shirt',
    ),
    ProductData(
      amount: 540.0,
      description: 'the best in the bag industry',
      id: 'p4',
      imagePics: Image.asset('asset/image/amani.jpeg'),
      title: 'Amani Bag',
    ),
    ProductData(
      amount: 920.0,
      description: 'Non stick, non rust',
      id: 'p5',
      imagePics: Image.asset('asset/image/pan1.jpeg'),
      title: 'Tower Non Stick Frying Pan',
    ),
    ProductData(
      amount: 682.0,
      description: 'We are the standard in women fashion',
      id: 'p6',
      imagePics: Image.asset('asset/image/dior.jpeg'),
      title: 'Dior Female Shoe',
    )
  ];


  List<ProductData> get items{
    return [...Dummy_Product];
  }

 
}
