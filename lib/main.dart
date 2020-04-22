import 'dart:ffi';

import 'package:beerapp/screens/info_screen.dart';
import 'package:beerapp/src/models/item_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  final List<ItemModel> produkter;
  String image = "https://live.nemligstatic.com/scommerce/images/ginger-beer.jpg?i=XsSg5nlT/5037934&w=623&h=623&mode=pad";
  String name = "Tuborg Classic";
  String description = "God og classisk øl, præcis som den skal være";
  double rating = 5.0;
  double price = 20.0;
  int rating_count = 30;

  HomeScreen({this.produkter});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "lib/images/oelikon.png",
                  height: 45,
                ),
                Text("Ølkompagniet")
              ],
            ),
          ),
          body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => InfoScreen()
                      ));
                    },
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            child: Image.network(
                              //image url
                              image,
                              height: 80,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //name
                              Text(
                                name,
                                style: TextStyle(fontSize: 20, fontWeight:  FontWeight.bold),
                              ),
                              //description
                              Text(
                                description,
                                style: TextStyle(fontSize: 15),
                              ),

                              //Row skal laves til en widget som viser bedømmelse med stjerner
                              Row(
                                children: <Widget>[
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  //rating_count
                                  Text("("+rating_count.toString()+")"),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}