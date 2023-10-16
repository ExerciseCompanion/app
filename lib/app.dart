import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/pets.dart';
import 'screens/shop.dart';
import 'screens/tasks.dart';
import 'screens/customization.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/',
      routes: {
        //'/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => const HomePage(),
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