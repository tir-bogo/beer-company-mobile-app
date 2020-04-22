import 'package:flutter/material.dart';
import 'package:beerapp/main.dart';

class InfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InfoScreenState();
  }
}

class _InfoScreenState extends State<InfoScreen> {
  String image =
      "https://live.nemligstatic.com/scommerce/images/ginger-beer.jpg?i=XsSg5nlT/5037934&w=623&h=623&mode=pad";
  String name = "Tuborg Classic";
  String description = "En flot strågylden øl med et knitrende og hvidt skum. Denne eksemplariske pilsner er blevet brygget siden 1842 og er den først bryggede pilsner. I både duft og smag dominerer den rene smag af friskt korn. Den friske korn bliver flot balanceret af en fin humlebitterhed, som samtidig giver en læskende friskhed og frugtighed. En rigtig pilsnerklassiker.";
  double rating = 5.0;
  double price = 20.0;
  int rating_count = 30;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                      image,
                      height: 300,
                    ),
                  ),
                  
                  Text(
                    name,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  //bedømmelse
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      //rating_count
                      Text("(" + rating_count.toString() + ")"),
                    ],
                  ),
                  Text(
                    "Pris: " + price.toString() + " kr.",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //description
                  Text(
                    description,
                    style: TextStyle(fontSize: 20),textAlign: TextAlign.center,
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
