import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  const FavouritesScreen(this.favouriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favouriteMeals.isEmpty
        ? Center(
            child: Text('You have no favourites yet!!!'),
          )
        : ListView.builder(
            itemCount: favouriteMeals.length,
            itemBuilder: (ctx, index) {
              return Container(
                child: MealItem(
                    id: favouriteMeals[index].id,
                    title: favouriteMeals[index].title,
                    imageUrl: favouriteMeals[index].imageUrl,
                    duration: favouriteMeals[index].duration,
                    complexity: favouriteMeals[index].complexity,
                    affordability: favouriteMeals[index].affordability),
              );
            });
  }
}
