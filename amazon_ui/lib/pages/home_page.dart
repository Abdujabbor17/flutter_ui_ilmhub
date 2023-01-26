import 'package:flutter/material.dart';

import '../items/itemCategory.dart';
import '../items/item_product.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categoryImage = [
    "assets/images/current/Oculus.jpg",
    "assets/images/current/Laptops.jpg",
    "assets/images/current/Women.jpg",
    "assets/images/current/Beauty.jpg",
  ];

  List<String> categoryName = [
    "Oculus",
    "Shop Laptops\n& Tablets",
    "Women's Fashion",
    "Beauty\nPicks"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mic_none,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          )
        ],
        title: Image(
          height: MediaQuery.of(context).size.height * 0.04,
          image: const AssetImage("assets/images/current/amazon_logo.png"),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.tealAccent.shade400.withOpacity(0.5),
                  Colors.tealAccent.shade200.withOpacity(0.7),
                  Colors.tealAccent.shade100.withOpacity(0.9),
                ]
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  //isCollapsed: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "What are you looking for?",
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  suffixIcon:
                      Icon(Icons.camera_alt_outlined, color: Colors.black)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // #location
            Container(
              color: Colors.tealAccent.shade200.withOpacity(0.4),
              height: MediaQuery.of(context).size.height * 0.06,
              child: Row(
                children: const [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      "Deliver to Uzbekistan",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            // #ship_product
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.08),
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.width * 1.05,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.blue.withOpacity(0.8),
                        Colors.blue.withOpacity(0.6),
                        Colors.grey.withOpacity(0.4),
                        Colors.grey.withOpacity(0.2),
                      ])),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                            "We ship over\n45 million products\naround the world",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                      Expanded(
                          child: Image.asset(
                        "assets/images/current/globus.png",
                        height: MediaQuery.of(context).size.width * 0.36,
                      ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.58,
                      bottom: MediaQuery.of(context).size.width * 0.02,
                      left: MediaQuery.of(context).size.width * 0.01,
                      right: MediaQuery.of(context).size.width * 0.01,
                  ),
                  height: MediaQuery.of(context).size.width * 1.05,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryImage.length,
                      itemBuilder: (context, index) {
                        return categoryItem(
                          context,
                            categoryName[index], categoryImage[index]);
                      }),
                )
              ],
            ),


            SizedBox(
              height: 495 *3,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                  itemBuilder: (context,index){
                return itemProduct(context);
              }),
            )
          ],
        ),
      ),
    );
  }


}
