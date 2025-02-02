import 'package:scoped_model/scoped_model.dart';

class Product extends Model {
  final String name;
  final String description;
  final int price;
  final String image;
  int rating;

  Product(this.name, this.description, this.price, this.image, this.rating);

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(json['name'], json['description'], json['price'],
        json['image'], json['rating']);
  }

  void updateRating(int myRating) {
    rating = myRating;

    notifyListeners();
  }

  static List<Product> getProducts() {
    List<Product> items = <Product>[];

    items.add(Product("name 1", "description", 10, "user.png", 0));
    items.add(Product("name 2", "description", 10, "user.png", 0));
    items.add(Product("name 3", "description", 10, "user.png", 0));
    items.add(Product("name 4", "description", 10, "user.png", 0));
    items.add(Product("name 5", "description", 10, "user.png", 0));
    items.add(Product("name 6", "description", 10, "user.png", 0));

    return items;
  }
}
