import 'package:exercise_companion/data_model/store_db.dart';
import 'package:exercise_companion/providers/pet_customization_provider.dart';
import 'package:exercise_companion/providers/pet_select_provider.dart';
import 'package:exercise_companion/providers/store_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopViewWidget extends ConsumerWidget {
  final String name;
  final String asset;
  final int type;
  final int itemID;
  final int productID;
  final int cost;

  const ShopViewWidget({
    super.key,
    required this.asset,
    required this.name,
    required this.type,
    required this.itemID,
    required this.productID,
    required this.cost,
  });

  /*Widget getSelectedWidget(bool completion) {
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
  }*/

  void onBuy(WidgetRef ref, int itemID, int productID, int itemType, int cost) {
    ref.read(storeProvider.notifier).purchase(itemID, productID, itemID, cost);
    ref.read(storeProvider.notifier).refresh();
    ref.read(selectPetProvider.notifier).refresh();
    ref.read(customizePetProvider.notifier).refresh();
    //ref.read(currencyProvider.notifier).refresh();
  }

  Widget buyButton(WidgetRef ref) {
    return ElevatedButton(
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () => {onBuy(ref, itemID, productID, type, cost)},
        child: const Text('Buy'));
  }

  Image petIcon(String asset, BuildContext context) {
    return Image(image: AssetImage(asset));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    HSVColor.fromAHSV(1, 200 % 360, 0.8, 1).toColor(),
                    HSVColor.fromAHSV(1, (200 + 20) % 360, 0.8, 1).toColor(),
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
                      child: buyButton(ref)) //getSelectedWidget(selected))
                ] //Center(child: Text("$index")),
                    ))));
  }
}
