import 'package:flutter/material.dart';
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
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BaseBottomNavigationBar());
  }
}
