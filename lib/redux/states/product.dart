import 'package:meta/meta.dart';

@immutable
class Product {
  final int id;
  final String name;
  final String description;
  final int merchantId;
  final String image;
  final String price;
  final String availableDate;


  Product({ this.id, this.name, this.description, this.merchantId, this.image, this.price, this.availableDate });

  Product copyWith({
    int id,
    String name,
    String description,
    int merchantId,
    String image,
    String price,
    String availableDate
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      merchantId: merchantId ?? this.merchantId,
      image: image ?? this.image,
      price: price ?? this.price,
      availableDate: availableDate ?? this.availableDate,
    );
  }

  static Product fromMap(dynamic map) {
    return Product(
      //TODO Michal: find a better way
        id: map['id'] as int,
        name: map['attributes']['name'] as String,
        description: map['attributes']['description'] as String,
        merchantId: map['relationships']['merchant']['data']['id'] as int,
        image: map['attributes']['image'] as String,
        price: map['attributes']['price'] as String,
        availableDate: map['attributes']['availableDate'] as String
    );
  }

  //TODO Michal: the below two may have to change
  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Product && id == other.id;
}