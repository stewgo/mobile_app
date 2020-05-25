import 'package:stewgo_app/redux/actions/fetchProducts.dart';
import 'package:stewgo_app/redux/states/user.dart';


Map<int, User> usersByIdReducer(Map<int, User> state, dynamic action) {
  if (action is FetchProductsSuccess) {
    var result = new Map<int, User>();

    action.users.forEach((user) {
      result[user.id] = user;
    });

    return result;
  }

  return state;
}