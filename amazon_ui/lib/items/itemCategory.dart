import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget categoryItem(BuildContext context,name, image) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.35,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    name,
                    style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ))),
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ))
        ],
      ),
    ),
  );
}