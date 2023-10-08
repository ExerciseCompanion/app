//https://www.youtube.com/watch?v=4okl2LsLUaU
import 'package:flutter/material.dart';

Widget accessoryCardWidget(int index) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
          decoration: const BoxDecoration(
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
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.0,
                      0.7,
                    ],
                    colors: [
                      Colors.teal,
                      Colors.indigo,
                    ],
                  )),
                  //color: const Color.fromARGB(255, 192, 192, 192),
                  width: 100,
                  height: 100,
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Stack(children: [
                        Image.asset("images/red_cap.png"),
                        Padding(
                            padding: const EdgeInsets.only(top: 55),
                            child: Text(
                              "$index",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                      ] //Center(child: Text("$index")),
                          ))))),
      //const SizedBox(height: 8),
      //Text("$index")
    ],
  );
}
