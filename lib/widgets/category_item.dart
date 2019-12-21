import 'package:flutter/material.dart';
import 'package:flutter_app/screens/meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color backgroundColor;
  final BorderRadius borderRadius = BorderRadius.circular(15);

  CategoryItem(this.id, this.title, this.backgroundColor);

  void navigateToMeal(BuildContext context) {
    // context helps Flutter understand the position of this widget in the
    // widget tree.
    Navigator.of(context)
        .pushNamed(Meals.routeName, arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToMeal(context),
      borderRadius: borderRadius,
      child: Container(
        // using const will not recreate the EdgeInsets class,
        // thus improving performance.
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [backgroundColor.withOpacity(0.7), backgroundColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: borderRadius),
      ),
    );
  }
}
