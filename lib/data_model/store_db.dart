import 'package:exercise_companion/data_model/accessory_db.dart';
import 'package:exercise_companion/data_model/pet_db.dart';
import 'package:flutter/material.dart';
import '../elements/shop_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreData {
  StoreData(
      {required this.id,
      required this.type,
      required this.itemID, //Change to product id
      required this.cost});

  int id;
  int type; // enum 0: accessory, 1: pet
  int itemID;
  int cost;
}

class StoreDB {
  StoreDB(this.ref);
  final ProviderRef<StoreDB> ref;

  final List<StoreData> _store = [
    StoreData(id: 0, type: 0, itemID: 2, cost: 10),
    StoreData(id: 1, type: 1, itemID: 0, cost: 10),
  ];

  /*UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }*/

  StoreData getStoreItem(int id) {
    return _store.firstWhere((element) => element.id == id);
  }

  List<StoreData> getAllStoreItems() {
    return _store.toList();
  }

  List<int> getAllStoreItemIDs() {
    return _store.map((e) => e.id).toList();
  }

  List<StoreData> getStoreItemsByIDs(List<int> ids) {
    return _store.where((element) => ids.contains(element.id)).toList();
  }

  List<Widget> getShopWidgetsByStoreDatas(List<StoreData> items) {
    final accessoryDB = ref.watch(accessoryDBProvider);

    List<Widget> widgets = [];
    String name = "";
    String asset = "";
    for (StoreData item in items) {
      if (item.type == 0) {
        AccessoryData accessory = accessoryDB.getAccessory(item.itemID);
        name = accessory.name;
        asset = accessory.asset;
      } else if (item.type == 1) {
        PetData pet = petDB.getPet(item.itemID);
        name = pet.name;
        asset = pet.asset;
      }

      widgets.add(ShopViewWidget(
          asset: asset,
          name: name,
          type: item.type,
          itemID: item.id,
          productID: item.itemID,
          cost: item.cost));
    }
    return widgets;
  }

  List<Widget> getShopWidgets() {
    return getShopWidgetsByStoreDatas(_store);
  }
}

//StoreDB storeDB = StoreDB();

final storeDBProvider = Provider<StoreDB>((ref) {
  return StoreDB(ref);
});
