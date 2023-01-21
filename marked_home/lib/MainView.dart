import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked_home/pages/cartPage.dart';
import 'package:marked_home/pages/likePage.dart';

import 'ProfilePage.dart';
import 'pages/home_page.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        // onPageChanged: (pageIndex) {
        //   // setState(() {
        //   //   _currentIndex = pageIndex;
        //   // });
        // },
        children: [
          HomePage(),
          CartPage(),
          LikePage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          showUnselectedLabels: true,

          onTap: (int index) {
             setState(() {
             _currentIndex = index;
             });
            _pageController.jumpToPage(index);
          }),
    );
  }
}
