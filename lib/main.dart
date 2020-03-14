// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stewgo_app/common/theme.dart';
import 'package:stewgo_app/models/mealList.dart';
import 'package:stewgo_app/screens/mealList.dart';
import 'package:stewgo_app/screens/meal.dart';
import 'package:stewgo_app/screens/orderConfirmation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => MealListModel()),
      ],
      child: MaterialApp(
        title: 'Stewgo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MealList(),
          '/meal': (context) => Meal(),
          '/orderConfirmation': (context) => OrderConfirmation()
        },
      ),
    );
  }
}
