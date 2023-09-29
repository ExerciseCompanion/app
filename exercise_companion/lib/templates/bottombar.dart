//https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
//https://www.flutterclutter.dev/flutter/troubleshooting/2022-03-23-bottom-navigation-bar-more-than-3-items/

import 'package:flutter/material.dart';

/// Flutter code sample for [BottomNavigationBar].

class BaseBottomNavigationBar extends StatefulWidget {
  final int index = 0;
  const BaseBottomNavigationBar({super.key, index}); //, required index});

  @override
  State<BaseBottomNavigationBar> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BaseBottomNavigationBar> {
  int _selectedIndex = 0;
  /*static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];*/

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    const pages = ["/", "/task", "/customization", "/pet", "/shop"];
    Navigator.pushNamed(context, pages[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checkroom),
            label: 'Customization',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Pets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed);
  }
}
