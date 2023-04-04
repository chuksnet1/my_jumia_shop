import 'package:flutter/material.dart';
import 'package:my_jumia_shop/model/product_data.dart';
import 'package:my_jumia_shop/provider/cart.dart';
import 'package:my_jumia_shop/provider/product_provider.dart';
import 'package:my_jumia_shop/screen/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final String title1;
  final Image magePic;
  final String id;
  final double amount;

  ProductItem({
    required this.magePic,
    required this.title1,
    required this.id,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final cartCollect = Provider.of<cartDummy_Data>(context);
    final prodLstn = Provider.of<ProductProvider>(context);

    return GridTile(
      child: Container(
          color: Colors.blue,
          margin: EdgeInsets.all(5),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProductDetailScreen.routeName, arguments: id);
              },
              child: magePic)),
      footer: GridTileBar(
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),
        backgroundColor: Colors.black87,
        title: Text(title1),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () => cartCollect.addCartItem(
            id,
            amount,
            title1,
          ),
        ),
      ),
    );
  }
}
