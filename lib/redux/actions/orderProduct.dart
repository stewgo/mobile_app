import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:stewgo_app/main.dart';
import 'package:stewgo_app/redux/states/order.dart';
import 'package:stewgo_app/utils/dataService.dart';

ThunkAction orderProduct(int productId) {
  return (Store store) async {
    new Future(() async {
      final accessToken = store.state.accessToken;

      DataService().orderProduct(productId, accessToken).then((Map<String, dynamic> result) {
        if (result.containsKey('data')) {
          print(result);
          final order = Order.fromMap(result);

          store.dispatch(OrderProductSuccess(order));
          Keys.navKey.currentState.pushReplacementNamed('/orderConfirmation');
        } else {
          //TODO Michal: error handling
          print('error');
        }
      });
    });
  };
}

class OrderProductSuccess {
  final Order order;

  OrderProductSuccess(this.order);
}