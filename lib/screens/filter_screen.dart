import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = "/filters";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Filter Page"),
      ),
    );
  }
}