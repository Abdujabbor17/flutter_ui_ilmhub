import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/post_model.dart';

Widget itemOfPost(BuildContext context,PostModel post) {
  return Container(
    color: Colors.white,
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      children: [
        Stack(
          children: [
            FadeInImage(
              image: AssetImage(post.postImage),
              placeholder: const AssetImage("assets/images/placeholder.png"),
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
                child: Container(
              width: double.infinity,
                  height: 50,
                  color: Colors.black.withOpacity(0.2),
            )),
            Positioned(
                child:  Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Row(
                        children:[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image(
                              image: AssetImage(post.userImage),
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(post.username,
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert,color: Colors.white,),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Row(
              children:[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border),
            ),
          ],
        ),

        // #tags
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.visible,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Liked By ",
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: "Sigmund, Yessenia, Dayana",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextSpan(
                  text: " and",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: " 1263 others",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),

        // #caption
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 5,
          ),
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.visible,
            text: TextSpan(
              children: [
                TextSpan(
                  text: post.username,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextSpan(
                  text: post.caption,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),

        // #post date
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          alignment: Alignment.topLeft,
          child: const Text(
            "February 2022",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    ),
  );
}