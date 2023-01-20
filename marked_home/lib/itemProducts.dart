import 'package:flutter/material.dart';

Widget productItem(
    {required BuildContext context,
    required bool isLiked,
    required void Function() onPrassLike,
    required void Function() DoubleLIke}) {
  return InkWell(
    onDoubleTap: DoubleLIke,
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
          InkWell(
            onTap: onPrassLike,
            child: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
    ),
  );
}
