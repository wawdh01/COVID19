import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loading();
  }

}

class _loading extends State<loading> {
  @override
  Widget build (BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SpinKitRotatingCircle(
            color: Colors.greenAccent,
            size: 10.0,
          ),
        ),
      ),
    );
  }

}