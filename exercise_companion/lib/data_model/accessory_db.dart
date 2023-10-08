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
        asset: "images/red_cap"),
  ];

  /*UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }*/
}

AccessoryDB accessoryDB = AccessoryDB();
