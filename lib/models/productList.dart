import 'package:flutter/material.dart';
import 'package:stewgo_app/utils/dataService.dart';
import 'package:stewgo_app/models/product.dart';

class ProductListModel extends ChangeNotifier {
  List<ProductModel> _meals = [];
  var _loaded = false;

  ProductListModel() {
    DataService().getProducts().then((dynamic result) {
      result.forEach((dynamic element) {
        _meals.add(ProductModel.fromMap(element));
      });
      _loaded = true;
      notifyListeners();
    });
  }

  List<ProductModel> getMeals() {
    return _meals;
  }

  bool isLoaded() {
    return _loaded;
  }
}

