import 'package:beerapp/fetch_products/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:beerapp/fetch_products/httplogic.dart';

class InfoScreen extends StatefulWidget {
  Products product;
  InfoScreen(Products product) {
    this.product = product;
  }
  @override
  State<StatefulWidget> createState() {
    return _InfoScreenState(this.product);
  }
}

class _InfoScreenState extends State<InfoScreen> {
  String image;
  String name;
  String description;
  double rating_average;
  double price;
  int rating_count;
  int id;
  _InfoScreenState(Products product) {
    this.id = product.id;
    this.name = product.name;
    this.description = product.description;
    this.image = product.image;
    this.price = product.price;
    this.rating_count = product.rating_count;
    this.rating_average = product.rating_average;
  }

  @override
  Widget build(BuildContext context) {
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
            Text("Ølkompagniet"),
            Container(
              height: 45,
              width: 45,
            )
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Image.network(
                      //image url
                      this.image,
                      height: 300,
                    ),
                  ),

                  Text(
                    this.name,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  //bedømmelse
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RatingBar(
                        initialRating: rating_average,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          API.postRating(this.id, rating.round().toInt());
                        },
                      ),
                      Text("("+this.rating_count.toString()+")",style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  Text(
                    "Pris: " + price.toString() + " kr.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //description
                  Text(
                    description,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
