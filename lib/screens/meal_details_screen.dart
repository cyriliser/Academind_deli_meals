import 'package:deli_meals/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/mean-detail';
  final Function toggleFavourite;
  final Function isMealFavourite;
  const MealDetailsScreen(this.toggleFavourite, this.isMealFavourite,
      {Key? key})
      : super(key: key);

  Widget buildSectionTitle(BuildContext ctx, title) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavourite(mealId),
        child: Icon(
          isMealFavourite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, selectedMeal.title),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ),
            )),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
