import 'package:flutter/material.dart';
import 'package:stewgo_app/models/meal.dart';

class Meal extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      final MealModel args = ModalRoute.of(context).settings.arguments;


      return Scaffold(
          appBar: AppBar(
            title: Text('Cart', style: Theme.of(context).textTheme.display4),
            backgroundColor: Colors.white,
          ),
          body: Text(args.name)
      );
    }
}
