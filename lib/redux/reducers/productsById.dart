import 'package:stewgo_app/redux/actions/fetchProducts.dart';
import 'package:stewgo_app/redux/states/product.dart';


Map<int, Product> productsByIdReducer(Map<int, Product> state, dynamic action) {
  if (action is FetchProductsSuccess) {
    var result = new Map<int, Product>();

    action.products.forEach((product) {
      result[product.id] = product;
    });
    return result;
  }

  return state;
}