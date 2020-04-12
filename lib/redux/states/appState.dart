import 'package:meta/meta.dart';
import 'package:stewgo_app/redux/states/product.dart';

@immutable
class AppState {
  final String accessToken;
  final Map<int, Product> productsById;

  AppState({@required this.accessToken, @required this.productsById});

  factory AppState.initial() {
    return AppState(
      accessToken: null,
      productsById: new Map<int, Product>()
    );
  }

  AppState copyWith({
    String accessToken,
  }) {
    return AppState(
      accessToken: accessToken ?? this.accessToken,
      productsById: productsById ?? this.productsById
    );
  }

  @override
  int get hashCode =>
      //isLoading.hash Code ^
  accessToken.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              accessToken == other.accessToken &&
              productsById == other.productsById;
}