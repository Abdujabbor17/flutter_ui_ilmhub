import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

RichText convertHashtag(String text) {
  List<String> split = text.split(" ");
  return RichText(
      text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 16),
          children: List.generate(split.length, (index) {
            return split.elementAt(index).startsWith("#") || split.elementAt(index).startsWith("@")
                ? TextSpan(
              text: split.elementAt(index) + " ",
              style: const TextStyle(color: Colors.lightBlueAccent),
            )
                : TextSpan(text: split.elementAt(index) + " ");
          })),


  );
}