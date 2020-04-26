import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:stewgo_app/redux/states/product.dart';
import 'package:stewgo_app/utils/dataService.dart';

ThunkAction fetchProducts() {
  return (Store store) async {
    new Future(() async {
      DataService().getProducts().then((dynamic result) {
        List<Product> products = [];

        result.forEach((dynamic element) {
          products.add(Product.fromMap(element));
        });
        store.dispatch(FetchProductsSuccess(products));
      });

    });
  };
}

class FetchProductsSuccess {
  final List<Product> products;

  FetchProductsSuccess(this.products);
}