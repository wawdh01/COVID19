import 'package:COVID19/chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:COVID19/fetchData.dart';


class netConnectivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _netConnectivityState();
  }
}

class _netConnectivityState extends State<netConnectivity> {

  List<Note> _notes = List<Note> ();
  Future<List<Note>> fetchNotes() async {
    var url = 'https://corona.lmao.ninja/v2/countries';
    var response = await http.get(url);

    var notes = List<Note>();
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Note.fromJson(noteJson));
      }
    }
    return notes;
  }
  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('images/corona2.gif'),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: GestureDetector(
              child: Card(
                color: Colors.greenAccent.withOpacity(0.50),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.network(_notes[index].title, width: 60.0, height: 45.0,),
                      ),
                      Expanded(
                        child:Text(
                          _notes[index].text,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                debugPrint(_notes[index].text);
                String cases = _notes[index].tcases.toString();
                String deaths = _notes[index].tdeaths.toString();
                String recovered = _notes[index].trecovered.toString();
                String total_c = _notes[index].todaycases.toString();
                String total_d = _notes[index].todaydeaths.toString();
                String total_r = _notes[index].todayrecovered.toString();
                return showModalBottomSheet(
                  enableDrag: true,
                  isScrollControlled: false,
                  elevation: 10.0,
                  isDismissible: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.80,
                          child:ListView(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.bed,
                                  color: Colors.white,
                                ),
                                title:Text(
                                  'Total Cases',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                trailing: Text(
                                  cases,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.bolt,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  'Total Deaths',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                trailing: Text(
                                  deaths,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.heart,
                                  color: Colors.white,
                                ),
                                title:Text(
                                  'Total Recovered',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                trailing: Text(
                                  recovered,
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.ambulance,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  'Today Cases',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                trailing: Text(
                                  total_c,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.bolt,
                                  color: Colors.white,
                                ),
                                title:Text(
                                  'Today Deaths',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                trailing: Text(
                                  total_d,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.heart,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  'Today Recovered',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                trailing: Text(
                                  total_r,
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              Container(
                                child: MyPieChart(_notes[index].activecases, _notes[index].tdeaths, _notes[index].trecovered),
                              )
                            ],
                          ),
                      ),  
                    );
                  },
                );
              },
            ),
          );
        },
        itemCount: _notes.length,
      ),
    );
  }

}