import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {

  static const routeName = '/categories-meals';
  
  final List<Meal> availableMeals;

  // final String categoryId;
  // final String categoryTitle;

  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {

    final routeargs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle = routeargs['title'];
    final categoryId = routeargs['id'];
    final categoryMeals = widget.availableMeals.where((meal) => meal.categories.contains(categoryId)).toList();

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
