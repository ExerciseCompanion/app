import 'package:flutter/material.dart';
import '../templates/appbar.dart';
import '../templates/bottombar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Home",
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                //child: BusinessCardWidget(),
              ),
              Stack(
                //alignment:new Alignment(x, y)
                children: <Widget>[
                  Image.asset(
                    'images/lake.jpg',
                    //width: 600,
                    //height: 240,
                    //fit: BoxFit.cover,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    left: 20.0,
                    child: Image.asset(
                      'images/pet_test.png',
                      //width: 600,
                      //height: 240,
                      //fit: BoxFit.cover,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BaseBottomNavigationBar());
  }
}
