//https://stackoverflow.com/questions/53411890/how-can-i-have-my-appbar-in-a-separate-file-in-flutter-while-still-having-the-wi

import 'package:exercise_companion/data_model/user_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseAppBar extends ConsumerWidget implements PreferredSizeWidget {
  //final Color backgroundColor = Colors.red;
  final String title;
  final AppBar appBar;
  //final List<Widget> widgets;

  /// you can add more fields that meet your needs

  //const BaseAppBar({Key key, this.title, this.appBar, this.widgets})
  //    : super(key: key);

  const BaseAppBar({super.key, required this.appBar, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentUserID = ref.watch(currentUserIDProvider);
    return AppBar(
      /*leading: IconButton(
        icon: const Icon(
          Icons.menu,
          semanticLabel: 'menu',
        ),
        onPressed: () {
          print('Menu button');
        },
      ),*/
      //elevation: 0,
      backgroundColor: Color.fromARGB(41, 255, 255, 255),
      title: Text(title),
      /*actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.settings,
            semanticLabel: 'filter',
          ),
          onPressed: () {
            print('Settings button');
          },
        ),
      ],*/

      actions: <Widget>[
        Text("\$${userDB.getUser(currentUserID).currency}    ",
            style: const TextStyle(fontSize: 20)),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
