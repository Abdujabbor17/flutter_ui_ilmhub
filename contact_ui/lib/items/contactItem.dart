

import 'package:contact_ui/models/contactModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget contactItem(
    BuildContext context,
    ContactModel contact){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 19,vertical: 2),
    margin: EdgeInsets.symmetric(vertical: 10),
    height: 50,
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        Image.asset('assets/images/profile.png'),
        SizedBox(width: 12,),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contact.surname != null?
              contact.name + ' '+ contact.surname! :  contact.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff000000)
              ),
            ),
            SizedBox(height: 4,),
            Text(
              contact.phoneNumber,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xff8B8B8B)
              ),
            ),

          ],
        )),
        SvgPicture.asset('assets/icons/phone.svg')

      ],
    ),
  );
}