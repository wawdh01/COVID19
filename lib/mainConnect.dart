import 'package:COVID19/globalData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:COVID19/chart.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class mainConnectivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _mainConnectivity();
  }

}

class _mainConnectivity extends State<mainConnectivity> {
  Map data;
  int cases = 0;
  int recovered = 0;
  int deaths = 0;
  int todayCases = 0;
  int todayDeaths = 0;
  int todayRecovered = 0;
  int active = 0;
  int affectedCountries = 0;
  int critical = 0;
  Future getData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    data = json.decode(response.body);
    setState(() {
      cases = data['cases'];
      recovered = data['recovered'];
      deaths = data['deaths'];
      todayCases = data['todayCases'];
      todayRecovered = data['todayRecovered'];
      todayDeaths = data['todayDeaths'];
      active = data['active'];
      affectedCountries = data['affectedCountries'];
      critical = data['critical'];
    });
    debugPrint(cases.toString());
    debugPrint(deaths.toString());
    debugPrint(recovered.toString());
    debugPrint(todayCases.toString());
    debugPrint(todayDeaths.toString());
    debugPrint(todayRecovered.toString());
  }

  @override
  void initState() {
    super.initState();
    getData();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
      ),
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Affected Countries',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: Text(
                    affectedCountries.toString(),
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Critical',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: Text(
                    critical.toString(),
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.1,
                  color: Colors.greenAccent,
                ),
                ListTile(
                  title: Text(
                    'Today Cases',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: Text(
                    todayCases.toString(),
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Today Deaths',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: Text(
                    todayDeaths.toString(),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Today Recovered',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: Text(
                    todayRecovered.toString(),
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.1,
            color: Colors.greenAccent,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                child:Container(
                  height: 130.0,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children:<Widget>[
                      Divider(
                        height: 20.0,
                        color: Colors.transparent,
                      ),
                      Text(
                        'Cases',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      Divider(
                        height: 20.0,
                        color: Colors.transparent,
                      ),
                      Text(
                        cases.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child:Container(
                  height: 130.0,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children:<Widget>[
                      Divider(
                        height: 20.0,
                        color: Colors.transparent,
                      ),
                      Text(
                        'Recovered',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      Divider(
                        height: 20.0,
                        color: Colors.transparent,
                      ),
                      Text(
                        recovered.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                child:Container(
                  height: 130.0,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children:<Widget>[
                      Divider(
                        height: 20.0,
                        color: Colors.transparent,
                      ),
                      Text(
                        'Active',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      Divider(
                        height: 20.0,
                        color: Colors.transparent,
                      ),
                      Text(
                        active.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child:Container(
                  height: 130.0,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children:<Widget>[
                      Divider(
                        height: 20.0,
                        color: Colors.transparent,
                      ),
                      Text(
                        'Deaths',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      Divider(
                        height: 20.0,
                        color: Colors.transparent,
                      ),
                      Text(
                        deaths.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.greenAccent,
            thickness: 0.1,
          )
        ],
      ),
    );
  }

}