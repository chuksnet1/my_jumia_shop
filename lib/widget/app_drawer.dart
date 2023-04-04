import 'package:flutter/material.dart';
import 'package:my_jumia_shop/screen/order_screen.dart';
import 'package:my_jumia_shop/screen/product_overview.dart';

class AppDrawer extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Drawer(
    child: Column(children: [
      AppBar(title: Text('Hello Beautiful'),),
      Divider(),
      GestureDetector(
        onTap: ()=> Navigator.of(context).pushNamed(OrderScreen.routeName),
        child: ListTile(leading: IconButton(onPressed: (){
           Navigator.of(context).pushNamed(OrderScreen.routeName);
        }, icon: Icon(Icons.shopping_bag)), title: Text('ORDER'),),
      ),
      Divider(),
      GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/'),
        child: ListTile(leading: Icon(Icons.home,), title: Text('HOME'),)),
    ]),);
  }
}