class Products {
  int id;
  String name;
  String description;
  String image;
  double price;
  int rating_count;
  double rating_average;

  Products(int id, String name, String description, String image, double price,
      int rating_count, double rating_average) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.image = image;
    this.price = price;
    this.rating_count = rating_count;
    this.rating_average = rating_average;
  }

  Products.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        image = json['image'],
        price =double.parse( json['price']),
        rating_count = json['rating_count'],
        rating_average = (json['rating_average'] == null )? 0.0:json['rating_average'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'rating_count': rating_count,
      'rating_average': rating_average
    };
  }
}
