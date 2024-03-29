import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {

  final List<Meal> favouriteMeals;

  FavouriteScreen(this.favouriteMeals);
  
  @override
  Widget build(BuildContext context) {

    if(favouriteMeals.isEmpty) {
      return Center(
      child: Text("You have no favourites yet - start adding some!"),
    );
    } else {
      return ListView.builder(
        itemCount: favouriteMeals.length,
        itemBuilder: (BuildContext conttext, int index){
          return MealItem(id: favouriteMeals[index].id,
            title: favouriteMeals[index].title, 
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          );
        },
      );
    }
  }
}