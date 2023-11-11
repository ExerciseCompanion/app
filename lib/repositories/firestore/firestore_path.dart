/// Defines the domain model path strings for [FirestoreService].
class FirestorePath {
  static String user(int userID) => 'users/$userID';
  static String users() => 'users';

  static String userStep(int userStepID) => 'userSteps/$userStepID';
  static String userSteps() => 'userSteps';

  static String userTask(int userTaskID) => 'userTasks/$userTaskID';
  static String userTasks() => 'userTasks';

  static String userPet(int userPetID) => 'userPets/$userPetID';
  static String userPets() => 'userPets';

  static String store(int storeID) => 'stores/$storeID';
  static String stores() => 'stores';

  static String pet(int petID) => 'pets/$petID';
  static String pets() => 'pets';

  static String accessory(int accessoryID) => 'accessories/$accessoryID';
  static String accessories() => 'accessories';
}
