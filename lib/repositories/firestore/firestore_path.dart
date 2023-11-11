/// Defines the domain model path strings for [FirestoreService].
class FirestorePath {
  static String user(String userID) => 'users/$userID';
  static String users() => 'users';

  static String userStep(String userStepID) => 'userSteps/$userStepID';
  static String userSteps() => 'userSteps';

  static String userTask(String userTaskID) => 'userTasks/$userTaskID';
  static String userTasks() => 'userTasks';

  static String userPet(String userPetID) => 'userPets/$userPetID';
  static String userPets() => 'userPets';

  static String store(String storeID) => 'stores/$storeID';
  static String stores() => 'stores';

  static String pet(String petID) => 'pets/$petID';
  static String pets() => 'pets';

  static String accessory(String accessoryID) => 'accessories/$accessoryID';
  static String accessories() => 'accessories';
}
