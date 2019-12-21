import 'package:flutter/material.dart';
import 'package:flutter_app/models/gourmet_data.dart';
import 'package:flutter_app/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  // this property can be accessed without instantiating the
  // meals class.
  static const routeName = '/meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final filteredMeals = DUMMY_MEALS
        .where(
          (meal) => meal.categories.contains(
            routeArgs['id'],
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              filteredMeals[index].id,
              filteredMeals[index].imageUrl,
              filteredMeals[index].title,
              filteredMeals[index].duration,
              filteredMeals[index].complexity,
              filteredMeals[index].affordability);
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
