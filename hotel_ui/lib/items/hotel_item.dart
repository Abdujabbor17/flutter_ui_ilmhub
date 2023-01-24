import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container hotelItem(BuildContext context, String image, String name) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    height: MediaQuery.of(context).size.height * 0.2,
    width: MediaQuery.of(context).size.width * 0.6,
    child: Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.25),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
      ],
    ),
  );
}
