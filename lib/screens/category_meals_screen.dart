import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy-data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {

  static const routeName = '/categories-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealScreen({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {

    final routeargs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle = routeargs['title'];
    final categoryId = routeargs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) => meal.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (BuildContext conttext, int index){
          return MealItem(id: categoryMeals[index].id,title: categoryMeals[index].title, imageUrl: categoryMeals[index].imageUrl,duration: categoryMeals[index].duration,complexity: categoryMeals[index].complexity,affordability: categoryMeals[index].affordability,);
        },
      ),
    );
  }
}
