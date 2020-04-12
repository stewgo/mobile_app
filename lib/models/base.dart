import 'package:redux/redux.dart';
import 'package:stewgo_app/redux/states/appState.dart';

class BaseModel {
  final String accessToken;

  BaseModel({
    this.accessToken
  });

  static BaseModel fromStore(Store<AppState> store) {
    print(store.state.productsById);
    print(store.state.accessToken);
    return BaseModel(
      accessToken: store.state.accessToken
    );
  }
}