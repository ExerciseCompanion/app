import 'package:exercise_companion/data_model/store_db.dart';
import 'package:exercise_companion/data_model/user_db.dart';
import 'package:exercise_companion/data_model/user_pets_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../templates/appbar.dart';
import '../templates/bottombar.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Shop",
        ),
        body: GridView.count(
            padding: EdgeInsets.all(10),
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            children: storeDB.getShopWidgetsByStoreDatas(
                userDB.getUnPurcahsedItems(currentUserID))),
        /*body: const Markdown(data: '''
# Shop Page
## Goals
To crate a shop page where the user may opt to 
purchase new items, ranging from cosmetics to
new pets.
## Content
- Cosmetic items
- Pets
- A unevenly spaced grid spaced array of potential products
## Action
- modals for purchase events/ functionality
- stores new purchased item in databse
'''),*/
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BaseBottomNavigationBar());
  }
}
