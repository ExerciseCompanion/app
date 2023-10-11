import 'package:exercise_companion/data_model/user_db.dart';
import 'package:exercise_companion/data_model/user_pets_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../templates/appbar.dart';
import '../templates/bottombar.dart';

class PetPage extends StatelessWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Pets",
        ),
        body: GridView.count(
          padding: EdgeInsets.all(10),
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: userPetDB.getPetWidgets(currentUserID),
        ),
        /*body: const Markdown(data: '''
# Pets Page
## Goals
A page to allow to user to select/ change primary pet
## Content
- A card list of owned pets
- Indication of currently selected pet
- Pet statistics
## Action
- Ability to select pet as primary

'''),*/
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BaseBottomNavigationBar());
  }
}
