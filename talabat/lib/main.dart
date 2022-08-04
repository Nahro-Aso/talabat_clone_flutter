import 'package:flutter/material.dart';
import 'package:talabat/navbar.dart';
import 'package:talabat/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: "gedinar"),
      home: NavBar(),
    );
  }
}
