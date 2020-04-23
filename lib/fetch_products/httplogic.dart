import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://127.0.0.1:8000/api/";

class API {
  static Future getProducts() {

    var data = http.get(baseUrl+"products/");
    print(data);

    return data;
  }
  static postRating(int productId, int rating) async {
    Map<String,String > headers = {"Content-type":"application/json"};
    String data = '{"product":$productId,"rating":$rating}';
    http.Response response = await http.post(baseUrl+"rating/",headers: headers,body: data);
    print(response.statusCode);
  }
}
