import 'package:facebook_ui/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'items/postItem.dart';
import 'items/storyItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "facebook",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade800,
              )),
          IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.camera_alt,
                color: Colors.grey.shade800,
              )),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // #search
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user_5.jpeg"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "What's on your mind?",
                          contentPadding: const EdgeInsets.only(left: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            // #live_photo_check
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                      children: const [
                        Icon(
                          Icons.video_call,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("Live")
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                    VerticalDivider(
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.photo,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("Photo")
                      ],
                    )),
                    VerticalDivider(
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("Check in")
                      ],
                    )),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 5,
            ),
            // #stories
            Container(
              height: 200,
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: storyList.length,
                  itemBuilder: (context, index) {
                    return storyItem(
                      context,
                       storyList[index]);
                  }),
            ),
            const Divider(
              thickness: 5,
            ),
            //#posts
            ListView.builder(
              itemCount: postList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return postItem(
                  context,
                postList[index],
                    (){
                    postList[index].isLiked = !postList[index].isLiked;
                    setState(() {});
                    }
                );
              },
            )
          ],
        ),
      ),
    );
  }


}
