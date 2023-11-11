import 'package:exercise_companion/features/accessory/domain/accessory_collection.dart';
// import 'package:exercise_companion/features/accessory/domain/accessory_db.dart';
import 'package:exercise_companion/features/pet/data/pet_provider.dart';
import 'package:exercise_companion/features/pet/domain/pet_collection.dart';
// import 'package:exercise_companion/features/pet/domain/pet_db.dart';
import 'package:flutter/material.dart';
import '../../accessory/domain/accessory.dart';
import '../../pet/domain/pet.dart';
import '../presentation/shop_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../accessory/data/accessory_provider.dart';

import 'store.dart';

class StoreCollection {
  //StoreDB(this.ref);
  //final ProviderRef<StoreDB> ref;
  StoreCollection(stores) : _stores = stores;
  final List<Store> _stores;

  /*UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }*/

  Store getStoreItem(int id) {
    return _stores.firstWhere((element) => element.id == id);
  }

  List<Store> getAllStoreItems() {
    return _stores.toList();
  }

  List<int> getAllStoreItemIDs() {
    return _stores.map((e) => e.id).toList();
  }

  List<Store> getStoreItemsByIDs(List<int> ids) {
    return _stores.where((element) => ids.contains(element.id)).toList();
  }

  List<Widget> getShopWidgetsByStoreDatas(
      List<Store> items, AccessoryCollection accessoryDB, PetCollection petDB) {
    // final accessoryDB = ref.watch(accessoryDBProvider);
    // PetDB petDB = ref.watch(petDBProvider);

    List<Widget> widgets = [];
    String name = "";
    String asset = "";
    for (Store item in items) {
      if (item.type == 0) {
        Accessory accessory = accessoryDB.getAccessory(item.itemID);
        name = accessory.name;
        asset = accessory.asset;
      } else if (item.type == 1) {
        Pet pet = petDB.getPet(item.itemID);
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

  List<Widget> getShopWidgets(
      AccessoryCollection accessoryDB, PetCollection petDB) {
    return getShopWidgetsByStoreDatas(_stores, accessoryDB, petDB);
  }
}

//StoreDB storeDB = StoreDB();

