import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stewgo_app/viewModels/productList.dart';
import 'package:stewgo_app/redux/states/appState.dart';
import 'package:stewgo_app/redux/states/product.dart' as ProductState;
import 'package:stewgo_app/redux/states/user.dart';
import 'package:stewgo_app/screens/product.dart';
import 'package:stewgo_app/utils/dataService.dart';
import 'package:stewgo_app/utils/formatDateTime.dart';
import 'package:stewgo_app/widgets/reusableDrawer.dart';


class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ProductListModel>(
      converter: (store) => ProductListModel.fromStore(store),
      builder: (context, viewModel) {
        return Scaffold(
          drawer: ReusableDrawer(),
          body: CustomScrollView(
            slivers: [
              _MyAppBar(),
              SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index < viewModel.products.length) {
                        final product = viewModel.products[index];
                        final merchant = viewModel.usersById[product.merchantId];

                        return _MyListItem(product, merchant);
                      } else {
                        return null;
                      }

                  }),
              ),
            ],
          ),
        );
      }
    );
  }
}

class _MyListItem extends StatelessWidget {
  final ProductState.Product meal;
  final User merchant;

  _MyListItem(this.meal, this.merchant, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.body1;
    var imageUrl = DataService().getImageUrl(meal.image);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 150,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/product', arguments: ProductScreenArguments(meal, merchant)),
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
                    Text('Seller:' + merchant.name, style: textTheme),
                    Text('Price: \$' + meal.price),
                    Text('Available from ' + formatDateTime(meal.availableDate))
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
    );
  }
}
