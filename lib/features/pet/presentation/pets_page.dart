import 'package:flutter/material.dart';
import '../../generic/presentation/app_bar.dart';
import '../../generic/presentation/bottom_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/pet_select_provider.dart';

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
          mainAxisSpacing: 10,
          children: ref.watch(selectPetProvider),
          //children: userPetDB.getPetWidgets(currentUserID),
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BaseBottomNavigationBar());
  }
}
