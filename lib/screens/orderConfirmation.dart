import 'package:flutter/material.dart';
import 'package:stewgo_app/models/meal.dart';
import 'package:stewgo_app/utils/dataService.dart';

class OrderConfirmation extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Order confirmation', style: Theme.of(context).textTheme.display4),
          ),
          body: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Text('Order has been confirmed!')
          )
      );
    }
}
