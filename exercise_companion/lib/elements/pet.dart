import 'package:flutter/material.dart';

class Pet extends StatelessWidget {
  final String background;
  final String pet;
  final String accessory;

  Pet({required this.background, required this.pet, required this.accessory});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF3D2C50),
          image: DecorationImage(
            image: AssetImage(background),
            fit: BoxFit.cover,
          ),
        ),
        child: _petRender(context));
  }

  Widget _petRender(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double adjusted = 0;
    double padding = 0;

    if (width <= 400) {
      adjusted = 0;
      padding = ((width - 400) + 200) / 2;
    } else {
      adjusted = (width - 400) / 2;
      padding = 100;
    }

    return Padding(
        padding: EdgeInsets.only(left: padding, right: padding),
        child: Center(
            child: Stack(
          //alignment:new Alignment(x, y)
          children: <Widget>[
            Positioned(
                bottom: 100,
                left: adjusted,
                right: adjusted,
                child: Image.asset(
                  pet,
                  //width: 600,
                  //height: 140,
                  //fit: BoxFit.cover,
                  fit: BoxFit.cover,
                )),
            Positioned(
                bottom: 200,
                left: adjusted,
                right: adjusted,
                child: Image.asset(
                  accessory,
                  //width: 600,
                  //height: 140,
                  //fit: BoxFit.cover,
                  fit: BoxFit.cover,
                )),
          ],
        )));
  }
}
