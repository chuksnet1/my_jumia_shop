import 'package:flutter/material.dart';
import 'package:my_jumia_shop/provider/cart.dart';

class Order {
  final String id;
  final double amount;
  final List<CartData> Product;
  final DateTime dateOrder;

  Order({
    required this.Product,
    required this.amount,
    required this.dateOrder,
    required this.id,
  });
}

class OrderItem with ChangeNotifier {
  List<Order> _item = [];

  List<Order> get item {
    return [..._item];
  }

  void addOrder(List<CartData> cartProducts, double total) {
    _item.insert(
        0,
        Order(
          Product: cartProducts,
          amount: total,
          dateOrder: DateTime.now(),
          id: DateTime.now().toString(),
        ));
        notifyListeners();
  }

  
}
