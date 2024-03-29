import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy-data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tab_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters = {
    "gluten" : false,
    "lactose" : false,
    "vegan" : false,
    "vegetarian" : false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String,bool> filterData) {
    setState(() {
     _filters =  filterData;
     _availableMeals = DUMMY_MEALS.where( (meal) {
       if(_filters['gluten'] && !meal.isGlutenFree){
         return false;
       }
       if(_filters['lactose'] && !meal.isLactoseFree){
         return false;
       }
       if(_filters['vegan'] && !meal.isVegan){
         return false;
       }
       if(_filters['vegetarian'] && !meal.isVegetarian){
         return false;
       }
       return true;
     }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex = _favouriteMeals.lastIndexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavouriteMeal(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Daily Meals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //  home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/' : (ctx) => TabsScreen(_favouriteMeals),
        //  '/categories-meals' : (ctx) => CategoryMealScreen(),
        CategoryMealScreen.routeName : (ctx) => CategoryMealScreen(_availableMeals),
        MealDetailScreen.routename : (ctx) => MealDetailScreen(_toggleFavourite, _isFavouriteMeal),
        FilterScreen.routeName : (ctx) => FilterScreen(_filters, _setFilters),
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (_) => CategoryMealScreen(_availableMeals));
      },
    );
  }
}
