import 'package:flutter/material.dart';

import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/widgets/meal_item.dart';

class CategoryMealsScrean extends StatelessWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  const CategoryMealsScrean(
    this.availableMeals, {
    Key? key,
  }) : super(key: key);
  // final String categoryId;
  // final String title;
  // const CategoryMealsScrean(
  //     {Key? key, required this.categoryId, required this.title})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? title = routeArgs['title'];
    final String? id = routeArgs['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title == null ? 'The Recipes' : title),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (ctx, index) {
              return Container(
                child: MealItem(
                    id: categoryMeals[index].id,
                    title: categoryMeals[index].title,
                    imageUrl: categoryMeals[index].imageUrl,
                    duration: categoryMeals[index].duration,
                    complexity: categoryMeals[index].complexity,
                    affordability: categoryMeals[index].affordability),
              );
            }),
      ),
    );
  }
}
