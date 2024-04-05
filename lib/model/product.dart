import 'package:uuid/uuid.dart';

enum Category {
  tech,
  sport,
  lifestyle,
}

class Product {
  String id;
  final String name;
  final Category category;
  final double price;

  Product({required this.name, required this.category, required this.price})
      : id = const Uuid().v1();

  Product.map(
    String uid, {
    required this.name,
    required this.category,
    required this.price,
  }) : id = uid;

  get fixedPrice {
    return price.toStringAsFixed(2);
  }
}
