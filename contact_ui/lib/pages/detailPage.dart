import 'package:contact_ui/pages/editContactPage.dart';
import 'package:contact_ui/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_page.dart';

class DetailPage extends StatefulWidget {
  DetailPage(this.index,{Key? key}) : super(key: key);
  int index;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xffffffff),
        title: const Text(
          'Contacts',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xff000000)
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 16,vertical: 60),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 14,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/profile.png',
                        fit: BoxFit.cover,
                        height: 84,
                      width: 84,),
                    ],
                  ),
                ),

                Expanded(
                  flex: 9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(onPressed: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Delete contact'),
                              content: Text('Are you sure you want to remove ${contacts[widget.index].name} from your contacts?'),
                              actions: [
                                InkWell(
                                    onTap: (){

                                    },
                                    child: Text('No',)),
                                SizedBox(width: 10,),
                                InkWell(
                                    onTap: (){
                                      contacts.removeAt(widget.index);
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(builder: (context) => HomePage()),
                                              (Route route) => false
                                      );
                                    },
                                    child: Text('Yes',style: TextStyle(color: Colors.red),)),
                                SizedBox()
                              ],
                            );
                          },
                        );


                      },
                          icon: Icon(Icons.delete)),
                      IconButton(
                          onPressed: (){

                            Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context)=> EditContact(widget.index))
                            );
                          },
                          icon: Icon(Icons.edit)),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 25,),
            Text(
                contacts[widget.index].name,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Color(0xff000000)
            ),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  contacts[widget.index].phoneNumber,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff000000)
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/call.svg'),
                    SizedBox(width: 10,),
                    SvgPicture.asset('assets/icons/message.svg'),


                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
