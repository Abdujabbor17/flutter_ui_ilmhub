import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked_home/attributes.dart';
import 'package:marked_home/productModel.dart';

import 'itemProducts.dart';
import 'likeItem.dart';

class LikePage extends StatefulWidget {
   LikePage({/*required this.list,*/Key? key}) : super(key: key);
 // List<ProductModel> list;

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Favorites'),),
      body: likedList.isEmpty?
      Center(child: Text('You have no favorite item'),)
      :ListView.builder(
          itemCount: likedList.length,
          itemBuilder: (context,index){
        return likeItem(context:context);
      }),
    );
  }
}
