import 'package:flutter/material.dart';

@immutable
class MealModel {
  final int id;
  final String name;
  final String description;
  final String merchant;


  MealModel({ this.id, this.name, this.description, this.merchant });

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is MealModel && other.id == id;

  static MealModel fromMap(dynamic map) {
    return MealModel(
        //TODO Michal: find a better way
        id: map['id'] as int,
        name: map['productName'] as String,
        description: map['description'] as String,
        merchant: map['merchantName'] as String
    );
   }
}