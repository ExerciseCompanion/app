class AccessoryData {
  AccessoryData(
      {required this.id,
      required this.name,
      required this.description,
      required this.asset});

  int id;
  String name;
  String description;
  String asset;
}

class AccessoryDB {
  final List<AccessoryData> _accessories = [
    AccessoryData(
        id: 0,
        name: "Red Cap",
        description: "A Red Cap",
        asset: "images/red_cap.png"),
    AccessoryData(
        id: 1,
        name: "Top Hat",
        description: "A Top Hat",
        asset: "images/top_hat.png"),
  ];

  AccessoryData getAccessory(int id) {
    return _accessories.firstWhere((item) => item.id == id);
  }

  List<AccessoryData> getAccessories(List<int> ids) {
    Map<int, int> lookUp = {};
    for (int id in ids) {
      lookUp[id] = 0;
    }
    return _accessories.where((item) => lookUp.containsKey(item.id)).toList();
  }
}

AccessoryDB accessoryDB = AccessoryDB();
