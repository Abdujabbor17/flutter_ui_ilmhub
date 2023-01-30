import 'package:flutter/material.dart';
import 'package:telegram_ui/pages/contactPage.dart';
import 'package:telegram_ui/pages/mainView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MainView(),
      routes: {
        '/ContactPage':(context) => const ContactPage(),
      },
    );
  }
}

