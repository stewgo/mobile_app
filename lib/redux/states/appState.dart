import 'package:meta/meta.dart';
import 'package:stewgo_app/redux/states/order.dart';
import 'package:stewgo_app/redux/states/product.dart';
import 'package:stewgo_app/redux/states/user.dart';

@immutable
class AppState {
  final String accessToken;
  final Map<int, Product> productsById;
  final Map<int, User> usersById;
  final Order order;

  AppState({@required this.accessToken, @required this.productsById, @required this.order, @required this.usersById });

  factory AppState.initial() {
    return AppState(
      accessToken: null,
      productsById: new Map<int, Product>(),
      order: null,
      usersById: new Map<int, User>()
    );
  }

  AppState copyWith({
    String accessToken,
    Map<int, Product> productsById,
    Order order,
    Map<int, User> usersById
  }) {
    return AppState(
      accessToken: accessToken ?? this.accessToken,
      productsById: productsById ?? this.productsById,
      order: order ?? this.order,
      usersById: usersById ?? this.usersById
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
              usersById == other.usersById &&
              order == other.order;
}