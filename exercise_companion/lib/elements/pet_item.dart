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
      return const Text("Selected");
    } else {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20)),
          onPressed: () {},
          child: const Text('Set as Primary'));
    }
  }

  Image petIcon(String asset, BuildContext context) {
    return Image(image: AssetImage(asset));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: petIcon(asset, context),
      title: Text(name),
      subtitle: Text(name),
      trailing: getSelectedWidget(selected),
    );
  }
}
