import 'package:flutter/material.dart';

class PetViewWidget extends StatelessWidget {
  final String name;
  final String asset;
  final int health;
  final int exp;
  final bool selected;

  const PetViewWidget(
      {super.key,
      required this.asset,
      required this.name,
      required this.health,
      required this.exp,
      required this.selected});

  Widget getSelectedWidget(bool completion) {
    if (completion) {
      return const Center(
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Text("In Use",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal))));
    } else {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20)),
          onPressed: () {},
          child: const Text('Select'));
    }
  }

  Image petIcon(String asset, BuildContext context) {
    return Image(image: AssetImage(asset));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            boxShadow: [
              BoxShadow(
                blurRadius: 20.0,
                color: Color.fromARGB(160, 0, 0, 0),
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

                child: Stack(children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 40, left: 20, right: 20, bottom: 40),
                      child: Image.asset(asset)),
                  Positioned(
                      top: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                          child: Text(
                        name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: getSelectedWidget(selected))
                ] //Center(child: Text("$index")),
                    ))));
    /*ListTile(
      leading: petIcon(asset, context),
      title: Text(name),
      subtitle: Text(name),
      trailing: getSelectedWidget(selected),
    );*/
  }
}
