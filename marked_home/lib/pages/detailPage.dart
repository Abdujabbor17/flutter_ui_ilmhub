import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked_home/models/productModel.dart';

class DetailPage extends StatefulWidget {
   DetailPage({required this.item,Key? key}) : super(key: key);

  ProductModel item;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DetailPage'),),
      body: Container(
        child: Center(
          child: Image.asset(widget.item.image!),
        ),
      ),
    );
  }
}
