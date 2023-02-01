

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/postModel.dart';

Widget postItem(
    BuildContext context,
    PostModel post,
    void Function() pressLike

    ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      ListTile(
        contentPadding: const EdgeInsets.only(left: 10),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(post.userImage),
        ),
        title: Text(
          post.name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.grey.shade900,
              letterSpacing: 1),
        ),
        subtitle: const Text(
          "1 hr ago",
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            color: Colors.grey.shade600,
            size: 30,
          ),
        ),
      ),
      Container(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Text(
            post.description,
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade800,
                height: 1.5,
                letterSpacing: .7),
          )),
      Image.asset(
          post.postImage,
          height: 240,
          fit: BoxFit.cover),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  badges.Badge(
                    position: BadgePosition.custom(

                      start: 20
                    ),
                      badgeContent: GestureDetector(
                        onTap: (){},
                        child: const CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 12,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      child:GestureDetector(
                        onTap: (){},
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.thumb_up_alt_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      )
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.08,),
                  Text("2.5K", style: TextStyle(color: Colors.grey.shade800, fontSize: 15),)
                ],
              ),
              Text("400 Comments", style: TextStyle(color: Colors.grey.shade800, fontSize: 13),),
            ],
          )),
      const Divider(
        thickness: 1,
        endIndent: 15,
        indent: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: pressLike,
                child: Row(
                  children: [
                    Icon(
                      post.isLiked?CupertinoIcons.hand_thumbsup_fill:CupertinoIcons.hand_thumbsup,
                      color: post.isLiked?Colors.blue:Colors.grey,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("Like", style: TextStyle(color: post.isLiked?Colors.blue:Colors.grey, fontSize: 16),)
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              )),
          Expanded(
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.grey,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Comment", style: TextStyle(color: Colors.grey, fontSize: 16),)
                  ],
                ),
              )),
          Expanded(
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.rotationY(pi),
                      child: const Icon(
                        CupertinoIcons.reply,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Share", style:  TextStyle(color: Colors.grey, fontSize: 16),)
                  ],
                ),
              )),
        ],
      ),
      const Divider(thickness: 8,)
    ],
  );
}
