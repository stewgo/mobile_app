import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stewgo_app/models/productList.dart';
import 'package:stewgo_app/models/product.dart';
import 'package:stewgo_app/utils/dataService.dart';

class ProductList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return
     Consumer<ProductListModel>(
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
  final List<ProductModel> mealList;

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
  final ProductModel meal;

  _MyListItem(this.meal, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.body1;
    var imageUrl = DataService().getImageUrl(meal.image);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 150,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/product', arguments: meal),
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
                    Text('Price: \$' + meal.price),
                    Text('Available from ' + meal.availableDate)
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
      /*
      actions: [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
        ),
      ],
       */
    );
  }
}
