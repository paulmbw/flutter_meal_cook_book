import 'package:flutter/material.dart';
import 'package:flutter_app/models/gourmet_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavourite;

  MealDetail(this.toggleFavourite);

  Widget buildTitle(String text, BuildContext buildContext) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(buildContext).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 300,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle('Ingredients', context),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildTitle('Steps', context),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(selectedMeal.steps[index]),
                      leading: CircleAvatar(
                        child: Text('${(index + 1)}'),
                        backgroundColor: Colors.blueAccent,
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        onPressed: () => toggleFavourite(mealId),
      ),
    );
  }
}
