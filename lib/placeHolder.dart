import 'package:flutter/material.dart';

class PlaceHolderWidget extends StatelessWidget {
  final Color color;
  PlaceHolderWidget(this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }

}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }

}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: ListView(
        children: <Widget> [
          ListTile(
            title: Text("Hello"),
            subtitle: Text("24/04/2020"),
          ),
           ListTile(
            title: Text("Hello"),
            subtitle: Text("24/04/2020"),
          ),
           ListTile(
            title: Text("Hello"),
            subtitle: Text("24/04/2020"),
          ),
           ListTile(
            title: Text("Hello"),
            subtitle: Text("24/04/2020"),
          ),
        ],
      ),
    );
  }

}