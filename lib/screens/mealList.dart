import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stewgo_app/models/mealList.dart';
import 'package:stewgo_app/models/meal.dart';

class MealList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return
     Consumer<MealListModel>(
         builder: (context, mealList, child) {
           if (mealList.isLoaded()) {
             return _ListView(mealList.getMeals());
           } else {
             return Text('Loading');
           }
         }
       );
  }
}

class _ListView extends StatelessWidget {
  final List<MealModel> mealList;

  _ListView(this.mealList);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index < this.mealList.length) {
                    return _MyListItem(this.mealList[index]);
                  } else {
                    return null;
                  }

              }),
          ),
        ],
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final MealModel meal;

  _MyListItem(this.meal, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.body1;
    var imageUrl = "https://assets.stewgo.com.au/meals/${meal.id}.jpg";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 150,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/meal', arguments: meal),
          child: Row(
            children: [
              Image.network(imageUrl, width: 150, height: 150),
              Container(
                width: 160,
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(meal.name, style: textTheme),
                    Text('Seller:' + meal.merchant, style: textTheme),
                    Text('Price: \$8.50'),
                    Text('Available from 8pm')
                  ]
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}


class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Meals', style: Theme.of(context).textTheme.display4),
      floating: true,
      actions: [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
        ),
      ],
    );
  }
}
