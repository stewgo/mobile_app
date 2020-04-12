import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:stewgo_app/main.dart';
import 'package:stewgo_app/redux/states/product.dart';
import 'package:stewgo_app/utils/dataService.dart';

ThunkAction orderProduct(int productId) {
  return (Store store) async {
    new Future(() async {
      var accessToken = store.state.accessToken;

      DataService().orderProduct(productId, accessToken).then((Map<String, dynamic> result) {
        if (result.containsKey('orderId')) {
          Keys.navKey.currentState.pushNamed('/orderConfirmation');
        } else {
          //TODO Michal: error handling
          print('error');
        }
      });
    });
  };
}

class FetchProductsSuccess {
  final List<Product> products;

  FetchProductsSuccess(this.products);
}