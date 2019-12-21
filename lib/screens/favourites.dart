import 'package:flutter/material.dart';
import 'package:flutter_app/models/meal.dart';
import 'package:flutter_app/widgets/meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favouriteMeals;

  Favourites(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      print(favouriteMeals);
      return Container(
        child: Text('Start adding favourites!'),
      );
    } else {
      print(favouriteMeals);
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              favouriteMeals[index].id,
              favouriteMeals[index].imageUrl,
              favouriteMeals[index].title,
              favouriteMeals[index].duration,
              favouriteMeals[index].complexity,
              favouriteMeals[index].affordability);
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
