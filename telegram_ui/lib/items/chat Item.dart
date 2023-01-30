import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/chat_Model.dart';




Widget chatItem(BuildContext context, ChatModel item) {
  return Container(padding: EdgeInsets.all(8),
    width: MediaQuery.of(context).size.width,
    height: 70,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        SizedBox(
          height:50,
          width: 50,
          child: ClipOval(
            child: Image.asset(
              item.image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: 15,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                item.name,

              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.lastMessage,
                  ),
                  Text(
                    item.time,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
