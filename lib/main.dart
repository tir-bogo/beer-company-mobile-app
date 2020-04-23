import 'dart:convert';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'fetch_products/httplogic.dart';
import 'package:beerapp/fetch_products/products.dart';
import 'package:beerapp/screens/info_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var products = new List<Products>();

  _getProducts() {
    API.getProducts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        products = list.map((model) => Products.fromJson(model)).toList();
      });
    }
    );
  }

  initState() {
    super.initState();
    _getProducts();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
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
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InfoScreen(products[index])));
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Image.network(
                            //image url
                            products[index].image,
                            height: 80,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //name
                            Text(
                              products[index].name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            //description
                            Text(
                              products[index].description,
                              style: TextStyle(fontSize: 15),
                            ),
                            //bedømmelse
                            Row(
                              children: <Widget>[
                                RatingBarIndicator(
                                  rating: products[index].rating_average,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 25.0,
                                  direction: Axis.horizontal,
                                ),
                                Text("("+products[index].rating_count.toString()+")"),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            })
        );
  }
}