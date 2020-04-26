import 'package:stewgo_app/redux/actions/login.dart';

String accessTokenReducer(String state, dynamic action) {
  if (action is LoginAction) {
    return action.accessToken;
  }

  return state;
}