import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stewgo_app/redux/states/appState.dart';
import 'package:stewgo_app/redux/states/order.dart';

class OrderConfirmation extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return new StoreConnector<AppState, Order>(
        converter: (store) => store.state.order,
        builder: (context, viewModel) {

          return Scaffold(
              appBar: AppBar(
                title: Text('Order confirmation', style: Theme
                    .of(context)
                    .textTheme
                    .display4),
              ),
              body: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text('Order has been confirmed! Address is: ' + viewModel.merchant.address)
              )
          );
        }
      );
    }
}
