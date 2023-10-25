import 'package:flutter/material.dart';
import '../../generic/presentation/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar(), title: "Companion Selection"),
      resizeToAvoidBottomInset: false,
    );
  }
}
