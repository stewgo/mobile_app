// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stewgo_app/common/theme.dart';
import 'package:stewgo_app/redux/actions/fetchProducts.dart';
import 'package:stewgo_app/redux/actions/login.dart';
import 'package:stewgo_app/screens/productList.dart';
import 'package:stewgo_app/screens/product.dart';
import 'package:stewgo_app/screens/orderConfirmation.dart';
import 'package:stewgo_app/screens/register.dart';
import 'package:stewgo_app/screens/login.dart';
import 'package:stewgo_app/redux/states/appState.dart';
import 'package:stewgo_app/redux/reducers/app.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:stewgo_app/screens/yourOrder.dart';

void main() {
  runApp(MyApp());
}

// Keys is here so we can navigate from anywhere.
// https://brainsandbeards.com/blog/ultimate-redux-guide-for-flutter
class Keys {
  static final navKey = new GlobalKey<NavigatorState>();
}

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
      appStateReducer,
      initialState: new AppState.initial(),
      middleware: [thunkMiddleware]
  );


  @override
  Widget build(BuildContext context) {
    //TODO Michal: remove this hard coded token
    store.dispatch(LoginAction('lu8wgdEn4ZKI2/SL3AELkCJ5frPw4ax9'));
    store.dispatch(fetchProducts());

    return StoreProvider(
        store: store,
    // Using MultiProvider is convenient when providing multiple objects.
        child: MultiProvider(
          providers: [

          ],
          child: MaterialApp(
            title: 'Stewgo',
            theme: appTheme,
            initialRoute: '/',
            navigatorKey: Keys.navKey,
            routes: {
              '/productList': (context) => ProductList(),
              '/product': (context) => Product(),
              '/orderConfirmation': (context) => OrderConfirmation(),
              '/yourOrder': (context) => YourOrder(),
              '/register': (context) => RegisterPage(),
              '/': (context) => LoginPage()
            },
          ),
        )
    );
  }
}
