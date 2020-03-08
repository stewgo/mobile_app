import 'package:flutter/material.dart';
import 'package:stewgo_app/models/meal.dart';
import 'package:stewgo_app/utils/dataService.dart';

class Meal extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      final MealModel args = ModalRoute.of(context).settings.arguments;
      final imageUrl = DataService().getImageUrl(args.id);

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
                Text('Price: \$8.50'),
                Text('Available from 8pm'),
                ButtonBar(
                  children: [
                    RaisedButton(
                      onPressed: () {},
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
