import 'package:meta/meta.dart';
import 'package:stewgo_app/redux/states/product.dart';
import 'package:stewgo_app/redux/states/user.dart';

@immutable
class Order {
  final int id;

  // TODO Michal: this should be normalised.
  final Product product;
  final User merchant;


  Order({ this.id, this.product, this.merchant });

  Order copyWith({
    int id,
    Product product,
    User merchant
  }) {
    return Order(
      id: id ?? this.id,
      product: product ?? this.product,
      merchant: merchant ?? this.merchant
    );
  }

  static Order fromMap(dynamic map) {
    var merchant;
    var product;

    map['included'].forEach((dynamic element) {
      if (element['type'] == 'users') {
        merchant = User.fromMap(element);
      }
      if (element['type'] == 'products') {
        product = Product.fromMap(element);
      }
    });
    return Order(
      id: map['data']['id'] as int,
      product: product,
      merchant: merchant
    );
  }

  //TODO Michal: the below two may have to change
  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Order && id == other.id;
}