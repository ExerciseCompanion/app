//import 'dart:ffi';

import 'package:flutter/material.dart';

class BarWidget extends StatelessWidget {
  final double percentage;
  final Color color;

  BarWidget({required this.percentage, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      //width: 300,
      height: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: LinearProgressIndicator(
          value: percentage,
          valueColor: AlwaysStoppedAnimation<Color>(color),
          backgroundColor: Color(0xffD6D6D6),
        ),
      ),
    );
  }
}
