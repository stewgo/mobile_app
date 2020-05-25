import 'package:redux/redux.dart';
import 'package:stewgo_app/redux/states/appState.dart';
import 'package:stewgo_app/redux/states/product.dart';
import 'package:stewgo_app/redux/states/user.dart';

class ProductListModel {
  final List<Product> products;
  final Map<int, User> usersById;

  ProductListModel({
    this.products,
    this.usersById
  });

  static ProductListModel fromStore(Store<AppState> store) {
    final products = new List<Product>();

    store.state.productsById.values.forEach((product) {
      products.add(product);
    });

    return ProductListModel(
      products: products,
      usersById: store.state.usersById
    );
  }
}