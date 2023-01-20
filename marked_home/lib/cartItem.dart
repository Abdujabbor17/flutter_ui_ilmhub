import 'package:flutter/material.dart';

Widget cartItem( BuildContext context,) {
  return Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.symmetric(
      vertical: 15,
    ),
    height: MediaQuery.of(context).size.height * 0.30,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/applemac.png",
          ),
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
        Icons.shopping_cart ,
          color: Colors.red ,
          size: 40,
        ),
      ],
    ),
  );
}
