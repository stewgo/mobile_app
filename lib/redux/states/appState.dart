import 'package:meta/meta.dart';
import 'package:stewgo_app/redux/states/order.dart';
import 'package:stewgo_app/redux/states/product.dart';

@immutable
class AppState {
  final String accessToken;
  final Map<int, Product> productsById;
  final Order order;

  AppState({@required this.accessToken, @required this.productsById, @required this.order});

  factory AppState.initial() {
    return AppState(
      accessToken: null,
      productsById: new Map<int, Product>(),
      order: null
    );
  }

  AppState copyWith({
    String accessToken,
    Map<int, Product> productsById,
    Order order
  }) {
    return AppState(
      accessToken: accessToken ?? this.accessToken,
      productsById: productsById ?? this.productsById,
      order: order ?? this.order
    );
  }

  @override
  int get hashCode => accessToken.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              accessToken == other.accessToken &&
              productsById == other.productsById &&
              order == other.order;
}