import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked_home/attributes.dart';

import 'cartItem.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your cart'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cartList.length,
            itemBuilder: (context,index){
          return cartItem(context);
        }),
      ),

    );
  }
}
