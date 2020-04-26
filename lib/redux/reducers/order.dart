import 'package:stewgo_app/redux/actions/orderProduct.dart';
import 'package:stewgo_app/redux/states/order.dart';

Order orderReducer(Order state, dynamic action) {
  if (action is OrderProductSuccess) {
    return action.order;
  }

  return state;
}