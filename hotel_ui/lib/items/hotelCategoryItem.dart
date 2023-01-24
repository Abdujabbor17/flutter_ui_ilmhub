

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/hotelModel.dart';
import 'hotel_item.dart';

Widget hotelCategoryItem(
    BuildContext context,
    String categoryName,
    List<HotelModel> hotels
    ){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
    height: MediaQuery.of(context).size.height * 0.33,
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(categoryName,
        style: const TextStyle(
          fontSize:20,
          fontWeight: FontWeight.w600,
          color: Colors.black
        ),
        ),
        SizedBox(height: 10,),
        Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
                itemBuilder: (context,index){
              return hotelItem(
                  context,
                  hotels[index].image,
                  hotels[index].hotelName);
            })
        ),

        SizedBox(height: 10,)

      ],
    ),

  );
}