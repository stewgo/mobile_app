import 'package:redux/redux.dart';
import 'package:stewgo_app/redux/states/appState.dart';

// TODO Michal: could be deleted
class OrderConfirmationModel {
  final String accessToken;

  OrderConfirmationModel({
    this.accessToken
  });

  static OrderConfirmationModel fromStore(Store<AppState> store) {
    print(store.state.productsById);
    print(store.state.accessToken);
    return OrderConfirmationModel(
      accessToken: store.state.accessToken
    );
  }
}