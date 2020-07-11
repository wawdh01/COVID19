import 'package:flutter/material.dart';
import 'package:COVID19/home.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.grey[850],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: f_home(),
    );
  }

}