import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:COVID19/fetchNews.dart';
import 'package:url_launcher/url_launcher.dart';

class news extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _newsState();
  }
}

class _newsState extends State<news> {
  List<Note2> _notes = List<Note2>();
  Future<List<Note2>> fetchNotes2() async {
    var url = 'https://newsapi.org/v2/top-headlines?country=in&q=covid&apiKey=1b1855132de24c5ca5cbc9d60752a7f7';
    var response = await http.get(Uri.encodeFull(url), headers: {"Accept" : "application/json"});
    var notes = List<Note2>();
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      var rest = notesJson['articles'] as List;
      print(rest);
      notes = rest.map<Note2>((json) => Note2.fromJson(json)).toList();
    }
    return notes;
  }
  @override
  void initState() {
    fetchNotes2().then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('images/News.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          var data = [_notes[index].titlen, _notes[index].id, _notes[index].name, _notes[index].description, _notes[index].publishedAt, _notes[index].url, _notes[index].urlToImage];
          return Container(
            //padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: GestureDetector(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    leading: _notes[index].urlToImage != null ? Image.network(_notes[index].urlToImage, height: 70.0, width: 90.0) : Image.network('https://tse3.mm.bing.net/th?id=OIP.MZlO0-v-QxhCBl-YGo93LAHaEK&pid=Api&P=0&w=282&h=160', height: 70.0, width: 90.0),
                    title: Text(
                      _notes[index].titlen,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => newPage(data)));
                  },
                ),
              ),
            ),
          );
        },
        itemCount: _notes.length,
      ),
    );
  }
}

class newPage extends StatefulWidget {
  var data;
  newPage(this.data);
  @override
  State<StatefulWidget> createState() {
    return _newPage(data);
  }
}

class _newPage extends State<newPage> {
  var data;
  _newPage(this.data);
  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 (News)'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children:<Widget>[
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[850]),
                borderRadius : BorderRadius.circular(10.0),
              ),
              child: Center(
                child:Text(
                  data.elementAt(2) != null ? data.elementAt(2): 'Not Available',
                  style: TextStyle(
                    color: data.elementAt(2) == 'Hindustan Times' ? Colors.blue: Colors.red,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center( 
              child: data.elementAt(6) != null ? Image.network(data.elementAt(6), width: MediaQuery.of(context).size.width * 0.90) : Image.network('https://tse3.mm.bing.net/th?id=OIP.MZlO0-v-QxhCBl-YGo93LAHaEK&pid=Api&P=0&w=282&h=160', width: MediaQuery.of(context).size.width * 0.90),
            ),
            SizedBox(
              height: 20.0,
            ),
            ListTile(
              subtitle: Text(data.elementAt(4) != null ? data.elementAt(4): 'Not Available'),
            ),
            Divider(
              thickness: 10.0,
              color: Colors.transparent,
            ),
            Text(
              data.elementAt(3) != null ? data.elementAt(3): 'Data Not Available\n',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'For More Information about this news\n',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                )
              ),
            ),
            Center(
              child: InkWell(
                child: new Text(
                  'Click here !',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20.0,
                  ),
                ),
                onTap: () => launch(data.elementAt(5)),
              ),
            )
          ],
        ),
      )
    );
  }

}