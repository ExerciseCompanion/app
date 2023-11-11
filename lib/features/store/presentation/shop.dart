import 'package:exercise_companion/features/store/domain/store_db.dart.delete';
// import 'package:exercise_companion/features/user/domain/user_db.dart';
// import 'package:exercise_companion/features/pet/domain/user_pets_db.dart';
import 'package:exercise_companion/features/store/data/store_extended_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../generic/presentation/app_bar.dart';
import '../../generic/presentation/bottom_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopPage extends ConsumerWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Shop",
        ),
        body: GridView.count(
            padding: EdgeInsets.all(10),
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            children: ref.watch(storeProvider)),
        /*body: const Markdown(data: '''
# Shop Page
## Goals
To crate a shop page where the user may opt to 
purchase new items, ranging from cosmetics to
new pets.
## Content
- Cosmetic items
- Pets
- A unevenly spaced grid spaced array of potential products
## Action
- modals for purchase events/ functionality
- stores new purchased item in databse
'''),*/
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BaseBottomNavigationBar());
  }
}
