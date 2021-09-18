import 'package:deli_meals/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _biuldListTile(IconData icon, String title, VoidCallback handler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).accentColor,
              child: Text(
                'Cooking Up',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(height: 20),
            _biuldListTile(
              Icons.restaurant,
              'Meals',
              () => Navigator.of(context).pushReplacementNamed('/'),
            ),
            _biuldListTile(
              Icons.settings,
              'Filters',
              () => Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
