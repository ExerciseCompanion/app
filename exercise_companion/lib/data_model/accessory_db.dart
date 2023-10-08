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
  ];

  AccessoryData getAccessory(int id) {
    return _accessories.firstWhere((item) => item.id == 0);
  }
}

AccessoryDB accessoryDB = AccessoryDB();
