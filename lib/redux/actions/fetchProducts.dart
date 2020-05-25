import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:stewgo_app/redux/states/product.dart';
import 'package:stewgo_app/redux/states/user.dart';
import 'package:stewgo_app/utils/dataService.dart';

ThunkAction fetchProducts() {
  return (Store store) async {
    new Future(() async {
      DataService().getProducts().then((dynamic result) {
        List<Product> products = [];
        List<User> users = [];

        result['data'].forEach((dynamic element) {
          products.add(Product.fromMap(element));
        });
        result['included'].forEach((dynamic element) {
          users.add(new User(
            id: element['id'],
            name: element['attributes']['name']
          ));
        });
        store.dispatch(FetchProductsSuccess(products, users));
      });
    });
  };
}

class FetchProductsSuccess {
  final List<Product> products;
  final List<User> users;

  FetchProductsSuccess(this.products, this.users);
}