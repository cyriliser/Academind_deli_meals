import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/screens/categories_screen.dart';
import 'package:deli_meals/screens/favourites_screen.dart';
import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  const TabsScreen(this.favouriteMeals, {Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {'title': 'Categories', 'page': CategoriesScreen()},
      {'title': 'Favourites', 'page': FavouritesScreen(widget.favouriteMeals)}
    ];
    super.initState();
  }

  int _selectedPage = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
      ),
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPage]['page'] as Widget,
    );
  }
}
