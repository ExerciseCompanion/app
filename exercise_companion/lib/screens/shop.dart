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
        body: const Markdown(data: '''
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
'''),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BaseBottomNavigationBar());
  }
}
