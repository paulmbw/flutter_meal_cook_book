import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/category_item.dart';
import '../models/gourmet_data.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (category) =>
            CategoryItem(
              category.id,
              category.title,
              category.backgroundColor,
            ),
      )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
