import 'package:flutter/material.dart';
import 'package:stewgo_app/utils/dataService.dart';
import 'package:stewgo_app/models/meal.dart';

class MealListModel extends ChangeNotifier {
  List<MealModel> _meals = [];
  var _loaded = false;

  MealListModel() {
    DataService().getMeals().then((dynamic result) {
      result.forEach((dynamic element) {
        _meals.add(MealModel.fromMap(element));
      });
      _loaded = true;
      notifyListeners();
    });
  }

  List<MealModel> getMeals() {
    return _meals;
  }

  bool isLoaded() {
    return _loaded;
  }
}

