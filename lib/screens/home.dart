import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:starwarsapi/screens/result.dart';

class MyHome extends StatelessWidget {
  final TextEditingController _peoplecontroller = TextEditingController();

  void getData(String peopleid) async {
    http.Response response =
        await http.get('https://swapi.dev/api/people/?search=$peopleid');
    var data = jsonDecode(response.body);
    print(data['results']);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Container with R2-D2 Background
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/r2d2background.png"),
                fit: BoxFit.cover)),
        // Scaffolf with trasparent color background
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Image.network(
                'https://img.icons8.com/color/96/000000/star-wars.png'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _peoplecontroller,
                      decoration: InputDecoration(
                          fillColor: Color.fromRGBO(
                            246,
                            245,
                            245,
                            1,
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          hintText: 'Insira seu personagem'),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      width: 100,
                      height: 170,
                    ),
                    ButtonTheme(
                      minWidth: 160,
                      height: 60,
                      child: RaisedButton(
                        shape: Border.all(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            width: 2.5),
                        elevation: 15.0,
                        color: Color.fromRGBO(
                          205,
                          10,
                          10,
                          1,
                        ),
                        child: Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'SW'),
                        ),
                        onPressed: () {
                          final String peopleid = (_peoplecontroller.text);
                          getData(peopleid);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
