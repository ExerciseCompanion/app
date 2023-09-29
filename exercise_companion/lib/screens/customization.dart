import 'package:flutter/material.dart';
import '../templates/appbar.dart';
import '../templates/bottombar.dart';
import '../elements/accessory_card.dart';

class CustomizationPage extends StatelessWidget {
  const CustomizationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Wardrobe",
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              //alignment:new Alignment(x, y)
              children: <Widget>[
                Center(
                    child: Image.asset(
                  'images/lake.jpg',
                  //width: 600,
                  height: MediaQuery.of(context).size.height - 114,
                  //fit: BoxFit.cover,
                  fit: BoxFit.fill,
                )),
                Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 200)),
                    Center(
                      child: Image.asset(
                        'images/pet_test.png',
                        //width: 600,
                        height: 240,
                        //fit: BoxFit.cover,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
                accessoryContainer(context),
              ],
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BaseBottomNavigationBar());
  }

  Widget accessoryContainer(BuildContext context) {
    return Column(children: [
      Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height - 336)),
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
