import 'package:flutter/material.dart';

class PetOnly extends StatelessWidget {
  final String pet;
  final String accessory;

  PetOnly({required this.pet, required this.accessory});

  @override
  Widget build(BuildContext context) {
    return Container(child: _petRender(context));
  }

  Widget _petRender(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Center(
            child: Stack(
          //alignment:new Alignment(x, y)
          children: <Widget>[
            Positioned(
                bottom: 0,
                left: 10,
                right: 10,
                child: Image.asset(
                  pet,
                  //width: 600,
                  //height: 140,
                  //fit: BoxFit.cover,
                  fit: BoxFit.cover,
                )),
            Positioned(
                bottom: 100,
                left: 10,
                right: 10,
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
