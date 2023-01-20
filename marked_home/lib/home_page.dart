import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marked_home/likePage.dart';
import 'package:marked_home/productModel.dart';

import 'attributes.dart';
import 'itemProducts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            'Apple Product',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          actions: [
            /* InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LikePage(),
                      maintainState: false),
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 20, top: 10, bottom: 10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amberAccent,
                ),
                child: Center(child: Text(counter.toString())),
              ),
            )*/
          ],
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/qwerty.png'),
                      fit: BoxFit.cover,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Lifestyle sale',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, right: 80, left: 80),
                        child: Text(
                          'Shop Now',
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return productItem(
                        context: context,
                        isLiked: list[index].isLike,
                        image: list[index].image!,
                        onPressLike: () {
                          list[index].isLike = !list[index].isLike;
                          if (list[index].isLike) {
                            counter++;
                            likedList.add(list[index]);
                          } else {
                            counter--;
                            likedList.remove(list[index]);
                          }
                          setState(() {});
                        },
                        doubleLike: () {
                          list[index].isLike = !list[index].isLike;
                          if (list[index].isLike) {
                            counter++;
                            likedList.add(list[index]);
                          } else {
                            counter--;
                            likedList.remove(list[index]);
                          }
                          setState(() {});
                        },
                        onPressCart: () {
                          cartList.add(list[index]);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                            content: Text("Siz bu mahsulotni savatchaga qo\'shdingiz"),
                          ));

                          // Fluttertoast.showToast(
                          //     msg: "Siz bu mahsulotni savatchaga qo\'shdingiz",
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.CENTER,
                          //     timeInSecForIosWeb: 5,
                          //     backgroundColor: Colors.red,
                          //     textColor: Colors.white,
                          //     fontSize: 16.0
                          // );
                          setState(() {});
                        },
                        delete: () {
                          list.remove(list[index]);
                          setState(() {});
                        });
                  })
            ],
          ),
        )));
  }
}
