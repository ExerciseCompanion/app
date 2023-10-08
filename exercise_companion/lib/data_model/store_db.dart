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
    StoreData(id: 0, type: 0, itemID: 10, cost: 10),
    StoreData(id: 1, type: 0, itemID: 5, cost: 10),
  ];

  /*UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }*/
}

StoreDB storeDB = StoreDB();
