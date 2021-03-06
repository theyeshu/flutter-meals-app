import 'package:flutter/material.dart';

import '../widgets.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  FiltersScreen(this.filters, this.saveFilters);

  final Map<String, bool> filters;
  final Function saveFilters;

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters(context, {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              });
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                MySwitchTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newValue) => setState(() {
                    _glutenFree = newValue;
                  }),
                ),
                MySwitchTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (newValue) => setState(() {
                    _vegetarian = newValue;
                  }),
                ),
                MySwitchTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue) => setState(() {
                    _vegan = newValue;
                  }),
                ),
                MySwitchTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newValue) => setState(() {
                    _lactoseFree = newValue;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
