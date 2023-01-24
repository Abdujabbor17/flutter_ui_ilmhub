import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_ui/items/hotel_item.dart';
import 'package:logger/logger.dart';

import '../attributes.dart';
import '../items/hotelCategoryItem.dart';
import '../utils/functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.3,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/family.jpg')
                )
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                     const Text('What kind of hotel you need?',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                    ),
                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                          ),
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search for hotels...'
                        ),

                        onChanged: (val){
                          if(val != '') {
                            searchHotel(val);
                          }else{
                            searchedList.clear();
                          }
                          setState(() {});

                          //Logger().i(searchedList.length);
                          //print(searchedList.toString());
                        },

                      ),
                    )
                  ],
                ),
              ),
            ),
            searchedList.isNotEmpty?
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.26 * searchedList.length,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: searchedList.length,
                      itemBuilder: (context,index){
                    return hotelItem(
                        context,
                        searchedList[index].image,
                        searchedList[index].hotelName);
                  }),
                )
            :SizedBox(
              height: MediaQuery.of(context).size.height * 0.35 *
                  categoryList.length,
              child: ListView.builder(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categoryList.length,
                  itemBuilder: (context,index){
                return hotelCategoryItem(
                    context,
                    categoryList[index].categoryName,
                categoryList[index].hotels
                );
              }),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}


