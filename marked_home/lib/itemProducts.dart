import 'package:flutter/material.dart';

Widget productItem(
    { required BuildContext context,
    required bool isLiked,
      required String image,
    required void Function() onPressLike,
    required void Function() doubleLike,
      required void Function() onPressCart,
      required void Function() delete

    }) {
  return InkWell(
    onDoubleTap: doubleLike,
    child: Container(
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
          Column(
            children: [
              InkWell(
                onTap: onPressLike,
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: onPressCart,
                child: Icon(
                  Icons.shopping_cart ,
                  color: Colors.black,
                  size: 40,
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: delete,
                child: Icon(
                  Icons.delete ,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
