import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stewgo_app/redux/actions/orderProduct.dart';
import 'package:stewgo_app/redux/states/appState.dart';
import 'package:stewgo_app/redux/states/user.dart';
import 'package:stewgo_app/utils/dataService.dart';
import 'package:stewgo_app/redux/states/product.dart' as ProductState;
import 'package:stewgo_app/utils/formatDateTime.dart';

class ProductScreenArguments {
  final ProductState.Product product;
  final User merchant;

  ProductScreenArguments(this.product, this.merchant);
}

class Product extends StatelessWidget {

  _buildChildren(context, ProductScreenArguments screenArguments, Store<AppState> store) {
    final product = screenArguments.product;
    final imageUrl = DataService().getImageUrl(product.image);

    return [
      Image.network(imageUrl, width: 300, height: 300),
      Text(screenArguments.merchant.name),
      Text(product.description),
      Text('Price: \$' + product.price),
      Text('Available from ' + formatDateTime(product.availableDate)),
      ButtonBar(
          children: [
            RaisedButton(
              onPressed: () => store.dispatch(orderProduct(product.id)),
              child: const Text(
                  'Order',
                  style: TextStyle(fontSize: 20)
              ),
            ),
            RaisedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 20)
              ),
            ),
          ]
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final ProductScreenArguments arguments = ModalRoute.of(context).settings.arguments;

    return StoreBuilder(
      builder: (context, Store<AppState> store) {
        return Scaffold(
            appBar: AppBar(
              title: Text(arguments.product.name, style: Theme.of(context).textTheme.display4),
            ),
            body: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildChildren(context, arguments, store)
                )
            )
        );
      }
    ) ;
  }
}
