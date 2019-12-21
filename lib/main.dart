import 'package:flutter/material.dart';
import 'package:flutter_app/models/gourmet_data.dart';
import 'package:flutter_app/models/meal.dart';
import 'package:flutter_app/screens/meal_detail.dart';
import 'package:flutter_app/screens/meals.dart';
import 'package:flutter_app/screens/tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _favouriteMeals = [];

  void _toggleFavourites(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => mealId == meal.id),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'PlayfairDisplay',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(fontFamily: 'AbrilFatface', fontSize: 20),
              body1: TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 20),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => Tabs(_favouriteMeals),
        Meals.routeName: (_) => Meals(),
        MealDetail.routeName: (_) => MealDetail(_toggleFavourites),
      },
    );
  }
}
