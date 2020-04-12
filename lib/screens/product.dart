import 'package:flutter/material.dart';
import 'package:stewgo_app/utils/dataService.dart';
import 'package:stewgo_app/redux/states/product.dart' as ProductState;


class Product extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      final ProductState.Product args = ModalRoute.of(context).settings.arguments;
      final imageUrl = DataService().getImageUrl(args.image);

      return Scaffold(
          appBar: AppBar(
            title: Text(args.name, style: Theme.of(context).textTheme.display4),
          ),
          body: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(imageUrl, width: 300, height: 300),
                Text(args.merchant),
                Text(args.description),
                Text('Price: \$' + args.price),
                Text('Available from ' + args.availableDate),
                ButtonBar(
                  children: [
                    RaisedButton(
                      onPressed: () => Navigator.pushNamed(context, '/orderConfirmation'),
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
              ]
            )
          )
      );
    }
}
