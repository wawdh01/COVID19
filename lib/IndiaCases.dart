import 'package:COVID19/fetchIndiaData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class countryCases extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _countryCasesState();
  }
  
}

class _countryCasesState extends State<countryCases> {
  List<Note1> _notes = List<Note1>();
  Future<List<Note1>> fetchNotes1() async {
    var url = 'https://api.covidindiatracker.com/state_data.json';
    var response = await http.get(url);
    var notes = List<Note1>();
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Note1.fromJson(noteJson));
      }
    }
    return notes;
  }
  @override
  void initState() {
    fetchNotes1().then((value) {
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
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
            child: GestureDetector(
              child:Card(
                color: Colors.greenAccent.withOpacity(0.50),
                borderOnForeground: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text.rich(
                        TextSpan(
                          text: _notes[index].stateName + '\n',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: '(' + _notes[index].id + ')',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 10.0,
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                debugPrint(_notes[index].id);
                Navigator.push(context, MaterialPageRoute(builder: (context) => secondState(_notes[index].active, _notes[index].cured, _notes[index].deaths, _notes[index].district)));
              },
            ),
          );
        },
        itemCount: _notes.length,
      ),
    );
  }

}

class secondState extends StatefulWidget {
  int active;
  int cured;
  int deaths;
  var district;
  secondState(this.active, this.cured, this.deaths, this.district);
  @override
  State<StatefulWidget> createState() {
    var datas = [this.active, this.cured, this.deaths];
    return _secondStateSt(datas, district);
  }

}

class _secondStateSt extends State<secondState> {
  var datas;
  var district;
  var count;
  _secondStateSt(this.datas, this.district);
  @override
  Widget build(BuildContext context) {
    count = district.length;
    print(this.count);
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 (States)'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ),
      body: Container(
        child: Column(
          children:<Widget> [
            ListTile(
              leading: FaIcon(FontAwesomeIcons.bed),
              title: Text(
                'Active',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
              trailing: Text(
                this.datas[0].toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30.0,
                ),
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.bolt),
              title: Text(
                'Deaths',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
              trailing: Text(
                this.datas[2].toString(),
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                ),
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.heart),
              title: Text(
                'Recovered',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
              trailing: Text(
                this.datas[1].toString(),
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30.0,
                ),
              ),
            ),
            Divider(
              color: Colors.purple,
              thickness: 5.0,
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.forward),
              title: Text(
                'Confirmed',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
              trailing: Text(
                (this.datas[1] + this.datas[2] + this.datas[0]).toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30.0,
                ),
              ),
            ),
            Expanded(
              child:ListView.builder(
                itemBuilder: (context, int index) {
                  var data = district[index];
                  return Container(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: GestureDetector(
                      child: Card(
                        color: Colors.grey[850],
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            data['name'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.grey[850],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                              ),
                              contentPadding: EdgeInsets.all(10.0),
                              content: Stack(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.75,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Text(
                                          data['name'],
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Divider(
                                          color: Colors.deepPurple,
                                          thickness: 2.0,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Confirmed',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          trailing: Text(
                                            data['confirmed'].toString(),
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Zone',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          trailing: SizedBox(
                                            height: 25.0,
                                            width: 25.0,
                                            child:Container(
                                              color: data['zone'] == 'ORANGE' ? Colors.orange : data['zone'] == 'GREEN' ? Colors.green : data['zone'] == 'RED' ? Colors.red : data['confirmed'] <= 20 ? Colors.green: data['confirmed'] <= 100 ? Colors.orange : Colors.red,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          child: Container(
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(32.0),
                                                bottomRight: Radius.circular(32.0),
                                                topLeft: Radius.circular(32.0),
                                                topRight: Radius.circular(32.0),
                                              ),
                                            ),
                                            child: Text(
                                              'OK',
                                              style: TextStyle(
                                                color: Colors.grey[850],
                                                fontSize: 25.0,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),  
                                ],
                              ),
                            );
                          }
                        );
                      },
                    ),
                  );
                },
                itemCount:district.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

}