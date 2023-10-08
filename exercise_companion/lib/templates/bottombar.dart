//https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
//https://www.flutterclutter.dev/flutter/troubleshooting/2022-03-23-bottom-navigation-bar-more-than-3-items/

import 'package:flutter/material.dart';

/// Flutter code sample for [BottomNavigationBar].

class BaseBottomNavigationBar extends StatelessWidget {
  int _selectedIndex = 0;
  List<String> pages = ["/task", "/pet", "/", "/customization", "/shop"];

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

  void _onItemTapped(BuildContext context, int index) {
    //const pages = ["/task", "/pet", "/", "/customization", "/shop"];
    Navigator.pushNamed(context, pages[index]);
  }

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)?.settings.name);
    _selectedIndex = pages
        .indexWhere((item) => item == ModalRoute.of(context)?.settings.name);
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.task, size: 30),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pets, size: 30),
          label: 'Pets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 50),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.checkroom, size: 30),
          label: 'Customization',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, size: 30),
          label: 'Shop',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: (int index) {
        _onItemTapped(context, index);
      },
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
