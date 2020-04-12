import 'package:stewgo_app/redux/reducers/accessToken.dart';
import 'package:stewgo_app/redux/reducers/productsById.dart';
import 'package:stewgo_app/redux/states/appState.dart';



AppState appStateReducer(AppState state, action) {
  return AppState(
    accessToken: accessTokenReducer(state.accessToken, action),
    productsById: productsByIdReducer(state.productsById, action)
  );
}