import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function setFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(
    this.setFilters,
    this.currentFilters, {
    Key? key,
  }) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegitarian = false;
  bool _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegitarian = widget.currentFilters['vegitarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool value, Function fn) {
    return SwitchListTile(
        title: Text(title),
        value: value,
        subtitle: Text(subtitle),
        onChanged: (nv) {
          fn(nv);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Your Favourites'),
          actions: [
            IconButton(
                onPressed: () {
                  widget.setFilters({
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegitarian': _vegitarian,
                  });
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (bool nv) {
                    setState(
                      () {
                        _glutenFree = nv;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals',
                  _lactoseFree,
                  (bool nv) {
                    setState(
                      () {
                        _lactoseFree = nv;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan,
                  (bool nv) {
                    setState(
                      () {
                        _vegan = nv;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegiterian',
                  'Only include vegiterian meals',
                  _vegitarian,
                  (bool nv) {
                    setState(
                      () {
                        _vegitarian = nv;
                      },
                    );
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
