import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_ui/items/chat%20Item.dart';
import 'package:telegram_ui/pages/private_page.dart';

import 'all_page.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     tabController = TabController(length: 5, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF243E54),
        title: Text('Telegram',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.normal
        ),),
        actions: [
          Icon(Icons.lock),
          SizedBox(width: 15,),
          Icon(Icons.search),
          SizedBox(width: 20,),
        ],
        bottom: TabBar(
         // labelStyle: TextStyle(fontSize: 18, color: Colors.blue),
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          controller: tabController,
          isScrollable: true,
          tabs: [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Private',
            ),
            Tab(
              text: 'Groups',
            ),
            Tab(
              text: 'Channels',
            ),
            Tab(
              text: 'Bots',
            ),
          ],
        ),
        
      ),
      body: TabBarView(

        controller:tabController ,
        children: [
        AllPage(),
          PrivatePage()
      ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/ContactPage');
        },
        child: Icon(Icons.edit),

      ),
    );
  }
}
