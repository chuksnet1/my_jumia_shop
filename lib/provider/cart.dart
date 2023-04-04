import 'package:flutter/material.dart';

class CartData {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartData({
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
  });
}

class cartDummy_Data with ChangeNotifier {
  Map<String, CartData> _carItem = {};

  Map<String, CartData> get cartItem {
    return {..._carItem};
  }

  double get totalAmount {
    double total = 0;
    _carItem.forEach((key, cartValue) {
      total += cartValue.price * cartValue.quantity;
    });
    return total;
  }

  void addCartItem(String prodId, double price, String title) {
    if (_carItem.containsKey(prodId)) {
      _carItem.update(
          prodId,
          (catValue) => CartData(
                id: catValue.id,
                price: catValue.price,
                quantity: catValue.quantity + 1,
                title: catValue.title,
              ));
    } else {
      _carItem.putIfAbsent(
          prodId,
          () => CartData(
                id: prodId,
                price: price,
                quantity: 1,
                title: title,
              ));
    }
    notifyListeners();
  }

  void removeCartItem (String prodId){
    _carItem.remove(prodId);
    notifyListeners();
  }

  void cartClear (){
    _carItem.clear();
    notifyListeners();
  }
}
