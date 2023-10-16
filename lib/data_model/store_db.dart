import 'package:exercise_companion/data_model/accessory_db.dart';
import 'package:exercise_companion/data_model/pet_db.dart';
import 'package:flutter/material.dart';
import '../elements/shop_item.dart';

class StoreData {
  StoreData(
      {required this.id,
      required this.type,
      required this.itemID,
      required this.cost});

  int id;
  int type; // enum 0: accessory, 1: pet
  int itemID;
  int cost;
}

class StoreDB {
  final List<StoreData> _store = [
    StoreData(id: 0, type: 0, itemID: 0, cost: 10),
    StoreData(id: 1, type: 1, itemID: 0, cost: 10),
  ];

  /*UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }*/

  List<Widget> getShopWidgets() {
    List<Widget> widgets = [];
    String name = "";
    String asset = "";
    for (StoreData item in _store) {
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
          asset: asset, name: name, type: item.type, productID: item.itemID));
    }
    return widgets;
  }
}

StoreDB storeDB = StoreDB();