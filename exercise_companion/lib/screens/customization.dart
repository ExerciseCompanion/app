import 'package:flutter/material.dart';
import '../templates/appbar.dart';
import '../templates/bottombar.dart';
import '../elements/accessory_card.dart';
import '../elements/pet.dart';
import 'dart:math';

class CustomizationPage extends StatelessWidget {
  const CustomizationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Wardrobe",
        ),
        /*body: Column(children: [
          Container(
              decoration: const BoxDecoration(
                color: Color(0xFF3D2C50),
                /*image: DecorationImage(
                image: AssetImage('images/backgrounds/test.jpg'),
                fit: BoxFit.cover,
              ),*/
              ),
              height: MediaQuery.of(context).size.height - 114,
              child: Pet(
                  background: 'images/backgrounds/test.jpg',
                  pet: 'images/pet_test.png',
                  accessory: 'images/red_cap.png')),
          accessoryContainer(context),
        ]),*/
        body: Stack(children: [
          Pet(
              background: 'images/backgrounds/test.jpg',
              pet: 'images/pet_test.png',
              accessory: 'images/red_cap.png'),
          accessoryContainer(context)
        ]),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BaseBottomNavigationBar());
  }

  Widget accessoryContainer(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.only(
              top: max(MediaQuery.of(context).size.height - 336, 0))),
      Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.0,
                      color: Colors.grey,
                    ),
                  ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      color: Colors.white,
                      //width: 150,
                      height: 174,
                      child: SizedBox(
                          height: 210,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(12),
                            itemCount: 10,
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 12);
                            },
                            itemBuilder: (context, index) {
                              return accessoryCardWidget(index);
                            },
                          ))))))
    ]);
  }
}
