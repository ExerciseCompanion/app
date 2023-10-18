import 'package:exercise_companion/data_model/user_db.dart';
import 'package:exercise_companion/data_model/user_pets_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../templates/appbar.dart';
import '../templates/bottombar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/pet_select_provider.dart';

class PetPage extends ConsumerWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          children: ref.watch(selectPetProvider),
          //children: userPetDB.getPetWidgets(currentUserID),
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BaseBottomNavigationBar());
  }
}
