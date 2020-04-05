import 'package:flutter/material.dart';

@immutable
class ProductModel {
  final int id;
  final String name;
  final String description;
  final String merchant;
  final String image;
  final String price;
  final String availableDate;


  ProductModel({ this.id, this.name, this.description, this.merchant, this.image, this.price, this.availableDate });

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is ProductModel && other.id == id;

  static ProductModel fromMap(dynamic map) {
    return ProductModel(
        //TODO Michal: find a better way
        id: map['id'] as int,
        name: map['productName'] as String,
        description: map['description'] as String,
        merchant: map['merchantName'] as String,
        image: map['image'] as String,
        price: map['price'] as String,
        availableDate: map['availableDate'] as String
    );
   }
}