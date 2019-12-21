import 'package:flutter/material.dart';
import 'package:flutter_app/models/meal.dart';
import 'package:flutter_app/screens/categories.dart';
import 'package:flutter_app/screens/favourites.dart';

class Tabs extends StatefulWidget {
  final List<Meal> favouriteMeals;

  Tabs(this.favouriteMeals);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': Categories(),
        'title': 'Meals',
      },
      {
        'page': Favourites(widget.favouriteMeals),
        'title': 'Your favourites',
      },
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.greenAccent,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          ),
        ],
      ),
    );
  }
}
