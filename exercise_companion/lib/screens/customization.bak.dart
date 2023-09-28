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
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Padding(
                padding: EdgeInsets.all(15.0),
                //child: BusinessCardWidget(),
              ),*/
              SizedBox(
                  height: MediaQuery.of(context).size.height - 324,
                  child: Stack(
                    //alignment:new Alignment(x, y)
                    children: <Widget>[
                      Center(
                          child: Image.asset(
                        'images/lake.jpg',
                        //width: 600,
                        //height: 400,
                        //fit: BoxFit.cover,
                        fit: BoxFit.fill,
                      )),
                      Column(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 100)),
                          Center(
                            child: Image.asset(
                              'images/pet_test.png',
                              //width: 600,
                              height: 240,
                              //fit: BoxFit.cover,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
              /*SingleChildScrollView(
                  child: Row(children: [
                SizedBox(
                    height: 210,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(12),
                      itemCount: 10,
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 12);
                      },
                      itemBuilder: (context, index) {
                        return AccessoryCardWidget(index);
                      },
                    ))
              ]))*/
              SizedBox(
                  height: 210,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(12),
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 12);
                    },
                    itemBuilder: (context, index) {
                      return AccessoryCardWidget(index);
                    },
                  ))
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BaseBottomNavigationBar());
  }
}
