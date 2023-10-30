import 'dart:convert';

import 'package:artisanaflutterapp/models/rating.dart';

class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String? id;
  final List<Rating>? rating;
  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
      'rating': rating,
    };
  }

  // factory Product.fromJson(Map<String, dynamic> json) {
  //   return Product(
  //       id: json['id'],
  //       name: json['name'],
  //       cart: json['cart'],
  //       description: json['description'],
  //       quantity: json['quantity'],
  //       images: ["images"],
  //       category: json['category'],
  //       price: json['price']);
  // }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rating': rating,
      'description': description,
      'quantity': quantity,
      'price': price,
      'category': category,
      'images': images
    };
  }

  ///*fromjson
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'],
      rating: map['ratings'] != null
          ? List<Rating>.from(
              map['ratings']?.map(
                (x) => Rating.fromMap(x),
              ),
            )
          : null,
    );
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
