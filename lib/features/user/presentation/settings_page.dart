import 'package:flutter/material.dart';
import '../../generic/presentation/app_bar.dart';
import '../../generic/presentation/bottom_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Settings",
        ),
        body: GridView.count(
          padding: EdgeInsets.all(10),
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          //children: ref.watch(selectPetProvider),
          //children: userPetDB.getPetWidgets(currentUserID),
        ),
        resizeToAvoidBottomInset: false);
  }
}
