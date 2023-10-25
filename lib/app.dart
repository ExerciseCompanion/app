import 'package:flutter/material.dart';
import 'features/home/presentation/home.dart';
import 'features/pet/presentation/pets.dart';
import 'features/store/presentation/shop.dart';
import 'features/task/presentation/tasks.dart';
import 'features/pet/presentation/customization.dart';
import 'features/login/presentation/login.dart';
import 'features/pedometer/presentation/pedometer.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/',
      routes: {
        '/ptest': (BuildContext context) => PedoMeterPage(),
        '/': (BuildContext context) => LoginPage(),
        '/home': (BuildContext context) => const HomePage(),
        '/shop': (BuildContext context) => const ShopPage(),
        '/pet': (BuildContext context) => const PetPage(),
        '/task': (BuildContext context) => const TaskPage(),
        '/customization': (BuildContext context) => const CustomizationPage(),
      },
      //theme: _kTheme, // New code
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
