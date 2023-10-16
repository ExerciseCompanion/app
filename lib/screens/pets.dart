import 'package:flutter/material.dart';
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
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BaseBottomNavigationBar());
  }
}
