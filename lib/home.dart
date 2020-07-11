import 'package:COVID19/IndiaCases.dart';
import 'package:COVID19/mainConnect.dart';
import 'package:COVID19/netConnectivity.dart';
import 'package:flutter/material.dart';
import 'package:COVID19/placeHolder.dart';
import 'package:COVID19/news.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class f_home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }

}

class _HomeState extends State<f_home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    mainConnectivity(),
    netConnectivity(),
    countryCases(),
    news()
  ];
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID-19"),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.info),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      endDrawer: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent.withAlpha(0)),
          child: Container(
            width: _width * 0.80,
            decoration: BoxDecoration(
              color: Colors.grey[850],
              border: Border.all(),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
            ),
            child: Drawer(
              elevation: 10.0,
              child: Padding(padding: EdgeInsets.all(10.0),
                child: ListView(
                  children:<Widget>[
                    Container(
                      width: 100.0,
                      height: 140.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                      ),
                      child:Image(image: AssetImage('images/image11.jpg'), height: 240.0, width: 100.0),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                      ),
                      child:Image(image: AssetImage('images/image12.jpg'), height: 140.0, width: 100.0),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.40,
                    ),
                    Center(
                      child: Text(
                        'version: 1.O\n',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    ),
                    Center(
                      child: Text(
                        'Created by Gaurav Wawdhane',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent.withAlpha(0)),
          child: Container(
            width: _width * 0.80,
            decoration: BoxDecoration(
              color: Colors.grey[850],
              border: Border.all(),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0),topRight: Radius.circular(20.0)),
            ),
            child: Drawer (
              elevation: 10.0,
              child: Padding(padding: EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    Divider(),
                    Row(
                      children: <Widget>[
                        Image(image: AssetImage('images/men.png'), height: 130.0,),
                        Image(image: AssetImage('images/womwn.png'), height: 130.0,),
                      ],
                    ),
                    Divider(
                      color: Colors.indigoAccent,
                      thickness: 10.0,
                    ),
                    Text(
                      'Safety Measures..\n',
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 25.0,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                    Divider(
                      color: Colors.deepOrangeAccent,
                      thickness: 5.0,
                    ),
                    Container(
                      child:Column(
                        children:<Widget> [
                          Text.rich(
                            TextSpan(
                              text: '\n1) Regularly and throughly clean your hands with an alcohol-based hand rub or wash them with soap and water.\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                              children: <TextSpan> [
                                TextSpan(
                                  text: 'Why ?\n',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Washing hands with Soap and and Water or using alcohol-based hand rub kills viruses that may be on your hands.\n',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.deepPurple,
                            thickness: 2.0,
                          ),
                          Text.rich(
                            TextSpan(
                              text: '\n2) Maintain at least 1 Meter (3 feet) distance between yourself and others.\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                              children: <TextSpan> [
                                TextSpan(
                                  text: 'Why ?\n',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                TextSpan(
                                  text: 'When Someone coughs, sneezes, or speaks they spray small liquid droplets from their nose or mouth wich contain virus. If you are too close, yoou can breath in the droplets, including the COVID-19 virus if the person has the disease.\n',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.deepPurple,
                            thickness: 2.0,
                          ),
                          Text.rich(
                            TextSpan(
                              text: '\n3) Keep up to date on the latest information on the trusted sources, such as WHO or your local and national health authorities.\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                              children: <TextSpan> [
                                TextSpan(
                                  text: 'Why ?\n',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Local and National authorities are best placced to advise on what people in your area should be doing to protect themselves.\n',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.deepPurple,
                            thickness: 2.0,
                          ),
                          Text.rich(
                            TextSpan(
                              text: '\n4) Avoid Going to Crowded Places.\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                              children: <TextSpan> [
                                TextSpan(
                                  text: 'Why ?\n',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Where People come together in crowds, you are more likely to come into close contact with someone that has COVID-19  and it is more difficult to maintain physical distance of 1 meter(3 feet).\n',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.deepPurple,
                            thickness: 2.0,
                          ),
                          Text.rich(
                            TextSpan(
                              text: '\n5) Make sure you and the peoplw around you , follow good respiratory hygiene.This means covering your mouth and nose with your bent elbow or tissue when you cough or sneeze.Then dispose of the uesd tissue immediately and wash your hands.\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                              children: <TextSpan> [
                                TextSpan(
                                  text: 'Why ?\n',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Droplets spread virus. By following good respiratory hygiene, you protect the people around you from viruses such as cold, flu and COVID-19.\n',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.deepOrangeAccent,
                            thickness: 5.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar (
        backgroundColor: Colors.grey[850],
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.globeAsia),
            title: Text("Country"),
          ),
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('images/IndiaMap.png'),width: 30.0,height: 25.0),
            title: Text("India"),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.newspaper),
            title: Text("News"),
          ),
        ],
      ),
    );
  }

  void onTabTapped (int index ) {
    setState(() {
      _currentIndex = index;
    });
  }
}