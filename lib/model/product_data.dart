import 'package:flutter/material.dart';

class ProductData with ChangeNotifier{
  final String id;
  final String title;
  final double amount;
  final String description;
  bool isFavourite;
  final Image imagePics;
  


  ProductData({
    
    required this.amount,
    required this.description,
    required this.id,
    this.isFavourite = false,
    required this.imagePics,
    required this.title,
  });
}
