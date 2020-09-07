import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:starwarsapi/screens/films.dart';
import 'package:starwarsapi/screens/starships.dart';
import 'package:starwarsapi/screens/vehicles.dart';

class ResultPage extends StatefulWidget {
  final peopleid;
  var jsonData;

  ResultPage({Key key, this.peopleid}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Future getData(String peopleid) async {
    http.Response response =
        await http.get('https://swapi.dev/api/people/?search=$peopleid');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'];
      print(data);
      return data;
    } else {
      print(response.statusCode);
    }
  }

  void retrieveData() async {
    widget.jsonData = await getData(widget.peopleid);
    //getHomeworld(widget.jsonData[0]['homeworld']);
    isLoading = false;
    setState(() {});
  }

  String name;
  bool isLoading = true;

  @override
  void initState() {
    retrieveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: Color.fromRGBO(46, 51, 57, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.network(
            'https://img.icons8.com/color/96/000000/star-wars.png'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  height: 16.0,
                ),
                // Card with name, gender and birth year
                Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(widget.jsonData[0]['name']),
                    subtitle: Text(
                      'gender: ' +
                          widget.jsonData[0]['gender'] +
                          '   ' +
                          'birth year: ' +
                          widget.jsonData[0]['birth_year'],
                    ),
                    leading: Icon(Icons.person),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: Icon(Icons.label_important),
                    contentPadding: EdgeInsets.all(4.0),
                    title: Text('Measures'),
                    subtitle: Text('height: ' +
                        widget.jsonData[0]['height'] +
                        '  mass: ' +
                        widget.jsonData[0]['mass']),
                  ),
                ),

                // Card with colors
                Card(
                  child: ListTile(
                    leading: Icon(Icons.label_important),
                    contentPadding: EdgeInsets.all(4.0),
                    title: Text('Colors'),
                    subtitle: Text('hair: ' +
                        widget.jsonData[0]['hair_color'] +
                        '  skin: ' +
                        widget.jsonData[0]['skin_color'] +
                        '  eye: ' +
                        widget.jsonData[0]['eye_color']),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonTheme(
                      minWidth: 100,
                      height: 60,
                      child: RaisedButton(
                        color: Color.fromRGBO(0, 65, 109, 1),
                        child: Text('Movies',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MoviesPage()),
                          );
                        },
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 100,
                      height: 60,
                      child: RaisedButton(
                        color: Color.fromRGBO(0, 65, 109, 1),
                        child: Text('Vehicles',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VehiclesPage()),
                          );
                        },
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 100,
                      height: 60,
                      child: RaisedButton(
                        color: Color.fromRGBO(0, 65, 109, 1),
                        child: Text('Starships',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StarshipPage()),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
    return scaffold;
  }
}
