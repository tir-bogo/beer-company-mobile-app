import 'package:flutter/material.dart';

class ItemModel{
  int _id;
  String _name;
  String _description;
  String _image;
  int _price;
  int _rating;
  int _rating_count;
  ItemModel.fromJson(Map<String,dynamic> parsedJson){
    _id = parsedJson['id'];
    _name = parsedJson['name'];
    _description = parsedJson['description'];
    _image = parsedJson['image'];
    _price = parsedJson['price'];
    _rating = parsedJson['rating'];
    _rating_count = parsedJson['ratingCount'];
  }

  int get id => _id;

  String get name => _name;

  String get description => _description;

  String get image => _image;

  int get price => _price;

  int get rating => _rating;

  int get ratingCount => _rating_count;

  toList() {}
}