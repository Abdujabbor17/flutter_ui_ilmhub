import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Message'),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Stack(
              children: const [
                Icon(Icons.sort),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Text('A',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.white
                  ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.group),
                  SizedBox(width: 20,),
                  Text('New Group')
                ],
              ),
              SizedBox(height: 10,),
                Row(
                children: [
                  Icon(Icons.lock),
                  SizedBox(width: 20,),
                  Text('New Secret Chat')
                ],
              ),
              SizedBox(height: 10,),
                Row(
                children: [
                  Icon(CupertinoIcons.speaker_2_fill),
                  SizedBox(width: 20,),
                  Text('New Channel')
                ],
              ),
              SizedBox(height: 10,),
              Divider(thickness: 5,),
              SizedBox(height: 10,),
              SizedBox(
                height: 600,
              ),
              ListView.builder(
                  itemBuilder: (context,i){
                return Container(

                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
