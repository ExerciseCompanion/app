import 'package:exercise_companion/features/pet/data/pet_customization_provider.dart';
import 'package:exercise_companion/features/pet/data/pet_home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pet_only.dart';
import '../data/pet_select_provider.dart';

class PetViewWidget extends ConsumerWidget {
  final String name;
  final String petAsset;
  final String accessoryAsset;
  final double healthRatio;
  final double expRatio;
  final bool selected;
  final int userPetId;

  const PetViewWidget(
      {super.key,
      required this.petAsset,
      required this.accessoryAsset,
      required this.name,
      required this.healthRatio,
      required this.expRatio,
      required this.selected,
      required this.userPetId});

  void onSelectPet(WidgetRef ref) {
    ref.read(selectPetProvider.notifier).select(userPetId);
    ref.read(customizePetProvider.notifier).refresh();
    ref.read(homePetProvider.notifier).refresh();
  }

  Widget getSelectedWidget(bool completion, WidgetRef ref) {
    //final counter = ref.watch(selectPetProvider);
    //print(counter);
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
          onPressed: () => {onSelectPet(ref)},
          child: const Text('Select'));
    }
  }

  Image petIcon(String asset, BuildContext context) {
    return Image(image: AssetImage(asset));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final petSelection = ref.watch(selectPetProvider);

    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            boxShadow: [
              BoxShadow(
                blurRadius: 7.0,
                color: Color.fromARGB(160, 0, 0, 0),
              ),
            ]),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0.0,
                    0.7,
                  ],
                  colors: [
                    HSVColor.fromAHSV(1, (healthRatio * 360) % 360, 0.8, 1)
                        .toColor(),
                    HSVColor.fromAHSV(1, ((expRatio * 360) + 20) % 360, 0.8, 1)
                        .toColor(),
                  ],
                )),
                //color: const Color.fromARGB(255, 192, 192, 192),

                child: Stack(children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 40, left: 20, right: 20, bottom: 40),
                      child: PetOnly(
                          pet: petAsset,
                          accessory: accessoryAsset)), //Image.asset(asset)),
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
                      child: getSelectedWidget(selected, ref))
                ] //Center(child: Text("$index")),
                    ))));
  }
}
