//https://www.youtube.com/watch?v=4okl2LsLUaU
import 'package:flutter/material.dart';

Widget accessoryCardWidget(int index) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: const Color.fromARGB(255, 192, 192, 192),
            width: 150,
            height: 150,
            child: Center(child: Text("$index")),
          )),
      const SizedBox(height: 8),
      Text("$index")
    ],
  );
}
