class PetData {
  PetData(
      {required this.id,
      required this.name,
      required this.description,
      required this.maxHealth,
      required this.maxHunger,
      required this.maxExp,
      required this.asset});

  int id;
  String name;
  String description;
  int maxHealth;
  int maxHunger;
  int maxExp;
  String asset;
}

class PetDB {
  final List<PetData> _pets = [
    PetData(
        id: 0,
        name: "Test Pet",
        description: "A Friendly Companion",
        maxHealth: 0,
        maxHunger: 0,
        maxExp: 0,
        asset: "images/pet_test"),
  ];

  /*UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }*/
}

PetDB petDB = PetDB();
