import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{

  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1000),(){
      setState(() {
        _isVisible = false;
      });
    });
    openPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _isVisible?1:0,
        duration: const Duration(milliseconds: 1000),
        child: Center(
          child: Image.asset("assets/images/Amazon.png",
            width: MediaQuery.of(context).size.width*0.6,),
        ),
      ),
    );
  }

  void openPage(){
    Timer(const Duration(milliseconds: 2000),(){
      setState(() {
        _isVisible = false;
      });
      Navigator.pushReplacementNamed(context, '/HomePage');
    });
  }
}
