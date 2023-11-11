import 'accessory.dart';

class AccessoryCollection {
  AccessoryCollection(accessories) : _accessories = accessories;
  final List<Accessory> _accessories;

  Accessory getAccessory(int id) {
    return _accessories.firstWhere((item) => item.id == id);
  }

  List<Accessory> getAccessories(List<int> ids) {
    Map<int, int> lookUp = {};
    for (int id in ids) {
      lookUp[id] = 0;
    }
    return _accessories.where((item) => lookUp.containsKey(item.id)).toList();
  }
}

//AccessoryDB accessoryDB = AccessoryDB();
