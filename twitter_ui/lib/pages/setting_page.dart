import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  bool switchLocationValue = false;
  bool switchPersonalizationValue = false;

  late String regionValue = 'Toshkent';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore Settings',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
            ),
            Text(
              '@abdujabbor_17',
              style: TextStyle(color: Colors.black45, fontSize: 14),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style:
              TextStyle(
                fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Show content in this Location',
                        style:
                        TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        'when this is on, you\'ll see, whats happening around you right now',
                        maxLines: 2,
                        style:
                        TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Switch(
                    value: switchLocationValue,
                    onChanged: (val){
                      switchLocationValue = val;
                      setState(() {});
                    })
              ],
            ),
            const SizedBox(height: 10,),
            const Divider(thickness: 1,),
            SizedBox(height: 24,),
            Text(
              'Personalization',
              style:
              TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trends for you',
                        style:
                        TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        'you can personalize the trends for you based on your location and who you follow',
                        maxLines: 2,
                        style:
                        TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Switch(
                    value: switchPersonalizationValue,
                    onChanged: (val){
                      switchPersonalizationValue = val;
                      setState(() {});
                    })
              ],
            ),
            const SizedBox(height: 10,),


            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    hint: Text('Select your region'),

                    value: regionValue,
                    items: <String>['Toshkent', 'Samarqand', 'Buxoro', 'Xorazm'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      regionValue = newValue!;
                      setState(() {});  print('New value selected: $newValue');
                    },
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: (){
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 200.0,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                )
                              ),
                              child: Column(
                                children: [
                                  Text("This is a bottom sheet"),
                                  SizedBox(height: 10,),
                                  ElevatedButton(onPressed: (){
                                    Navigator.pop(context);
                                  },
                                      child: Text('Pop'))
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text('Show BottomSheet')),

                  const SizedBox(height: 10),
                  PopupMenuButton(
                    // onSelected: (value) {
                    //   if(value == 'Delete'){
                    //     print('Successfully deleted');
                    //   }else{
                    //     print('Please Edit');
                    //   }
                    // },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                       PopupMenuItem(
                        value: 'Delete',
                        child: InkWell(
                            onTap: (){
                              print('Successfully deleted with InkWell');
                            },
                            child: Text('Delete')),
                      ),
                      const PopupMenuItem(
                        value: 'Edit',
                        child: Text('Edit'),
                      ),
                    ],
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
