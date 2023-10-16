//https://stackoverflow.com/questions/53411890/how-can-i-have-my-appbar-in-a-separate-file-in-flutter-while-still-having-the-wi

import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  //final Color backgroundColor = Colors.red;
  //final Text title;
  final AppBar appBar;
  //final List<Widget> widgets;

  /// you can add more fields that meet your needs

  //const BaseAppBar({Key key, this.title, this.appBar, this.widgets})
  //    : super(key: key);

  const BaseAppBar({super.key, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          semanticLabel: 'menu',
        ),
        onPressed: () {
          print('Menu button');
        },
      ),
      title: const Text('SHRINE'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
          onPressed: () {
            print('Search button');
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.tune,
            semanticLabel: 'filter',
          ),
          onPressed: () {
            print('Filter button');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
