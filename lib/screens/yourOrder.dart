import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stewgo_app/redux/states/appState.dart';
import 'package:stewgo_app/redux/states/order.dart';
import 'package:stewgo_app/utils/formatDateTime.dart';

class YourOrder extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return new StoreConnector<AppState, Order>(
        converter: (store) => store.state.order,
        builder: (context, viewModel) {

          return Scaffold(
              appBar: AppBar(
                title: Text('Your Order', style: Theme
                    .of(context)
                    .textTheme
                    .display4),
              ),
              body: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Your meal will be ready at: ' + formatDateTime(viewModel.product.availableDate)),
                      Text(''),
                      Text(viewModel.product.name),
                      Text('\$' + viewModel.product.price),
                      Text(''),
                      Text('Pickup instructions:'),
                      Text(viewModel.merchant.pickupInfo),
                      Text(''),
                      Text(viewModel.merchant.name + '\'s phone number: '),
                      Text(viewModel.merchant.phoneNumber),
                      Text(''),
                      Text('All details have been sent to your email'),
                      RaisedButton(
                        onPressed: () => Navigator.pushReplacementNamed(context, '/productList'),
                        child: const Text(
                            'OK',
                            style: TextStyle(fontSize: 20)
                        ),
                      )
                    ],
                  )
                  //child: Text('Order has been confirmed! Address is: ' + viewModel.merchant.address + ", Pickup instructions are: " + viewModel.merchant.pickupInfo)
              )
          );
        }
      );
    }
}
