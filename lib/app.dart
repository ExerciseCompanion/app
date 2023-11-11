import 'package:flutter/material.dart';
import 'features/home/presentation/home.dart';
import 'features/pet/presentation/pets_page.dart';
import 'features/store/presentation/shop.dart';
import 'features/task/presentation/tasks.dart';
import 'features/pet/presentation/customization.dart';
import 'features/login/presentation/login.dart';
import 'features/pedometer/presentation/pedometer.dart';
import 'features/user/data/user_database.dart';
import 'features/user/data/user_provider.dart';
import 'features/user/domain/user.dart';
import 'features/user/presentation/settings_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/user/data/theme_provider.dart';
import 'init_database.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  ThemeData getTheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return ThemeData.light(useMaterial3: true);
      case ThemeMode.dark:
        return ThemeData.dark(useMaterial3: true);
      default:
        return ThemeData.light(useMaterial3: true);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    rewriteFirebase(ref);
    final theme = ref.watch(themeProvider);

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
        '/settings': (BuildContext context) => const SettingsPage(),
      },
      //theme: _kTheme, // New code
      //theme: ThemeData.light(useMaterial3: true),
      theme: getTheme(theme),
    );
  }
}
