// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'products.dart';
// import 'package:flutter/services.dart';

// class ProductRepository{

// Future<List<Products>> fetchProductsFromAPI() async{
//   final response = await http.get('http://127.0.0.1:8000/api/products/');

//   final List<dynamic> data = json.decode(response.body);

//   return data.map((json) => Products.fromJson(json)).toList();
//   if (response.statusCode == 200) {
//     print(response);
//     //return Products.fromJson(json.decode(response.body));
//     //return data.map((json) => Products.fromJson(json)).toList();
    
//   }
//   else {
//     throw Exception('failed to load products');
//   }

//   }
// }