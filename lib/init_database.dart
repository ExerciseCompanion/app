import 'package:exercise_companion/features/user/domain/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/accessory/data/accessory_database.dart';
import 'features/accessory/data/accessory_provider.dart';
import 'features/accessory/domain/accessory.dart';
import 'features/pet/data/pet_database.dart';
import 'features/pet/data/pet_provider.dart';
import 'features/pet/data/user_pet_database.dart';
import 'features/pet/data/user_pet_provider.dart';
import 'features/pet/domain/pet.dart';
import 'features/pet/domain/user_pet.dart';
import 'features/store/data/store_database.dart';
import 'features/store/data/store_provider.dart';
import 'features/store/domain/store.dart';
import 'features/task/data/user_task_database.dart';
import 'features/task/data/user_task_provider.dart';
import 'features/task/domain/user_task.dart';
import 'features/user/data/user_database.dart';
import 'features/user/data/user_provider.dart';
import 'features/user/data/user_step_database.dart';
import 'features/user/data/user_step_provider.dart';
import 'features/user/domain/user_step.dart';

void rewriteFirebase(WidgetRef ref) {
  print("rewriting database");
  UserDatabase userDatabase = ref.watch(userDatabaseProvider);
  userDatabase.setUser(const User(
      id: 0,
      username: "@example",
      email: "example@example.edu",
      currency: 0,
      mainPetID: 0,
      backdropAsset: "images/backgrounds/test.jpg",
      purchasedItemsIDs: [],
      petInventoryIDs: [0],
      accessoryInventoryIDs: [0, 1, 1]));
  userDatabase.setUser(const User(
      id: 1,
      username: "@fakeuser",
      email: "fakeuser@hawaii.edu",
      currency: 0,
      mainPetID: 0,
      backdropAsset: "images/backgrounds/test.jpg",
      purchasedItemsIDs: [],
      petInventoryIDs: [1],
      accessoryInventoryIDs: [0, 1]));

  UserStepDatabase userStepDatabase = ref.watch(userStepDatabaseProvider);
  userStepDatabase.setUserStep(
      const UserStep(id: 0, userID: 0, date: "11/20/2023", steps: 1000));
  userStepDatabase.setUserStep(
      const UserStep(id: 1, userID: 0, date: "11/19/2023", steps: 500));
  userStepDatabase.setUserStep(
      const UserStep(id: 2, userID: 0, date: "11/18/2023", steps: 3000));
  userStepDatabase.setUserStep(
      const UserStep(id: 3, userID: 0, date: "11/17/2023", steps: 2100));
  userStepDatabase.setUserStep(
      const UserStep(id: 4, userID: 0, date: "11/16/2023", steps: 2200));
  userStepDatabase.setUserStep(
      const UserStep(id: 5, userID: 0, date: "11/15/2023", steps: 2300));
  userStepDatabase.setUserStep(
      const UserStep(id: 6, userID: 0, date: "11/14/2023", steps: 1900));
  userStepDatabase.setUserStep(
      const UserStep(id: 7, userID: 0, date: "11/13/2023", steps: 1700));

  UserTaskDatabase userTaskDatabase = ref.watch(userTaskDatabaseProvider);
  userTaskDatabase.setUserTask(const UserTask(
      id: 0,
      userID: 0,
      title: "Step",
      description: "Walk 20000 Steps",
      reward: 100,
      status: 0));
  userTaskDatabase.setUserTask(const UserTask(
      id: 1,
      userID: 0,
      title: "Pet",
      description: "Interact with your pet",
      reward: 100,
      status: 1));
  userTaskDatabase.setUserTask(const UserTask(
      id: 2,
      userID: 0,
      title: "Accessorize",
      description: "Change your pet's accessory",
      reward: 100,
      status: 2));

  UserPetDatabase userPetDatabase = ref.watch(userPetDatabaseProvider);
  userPetDatabase.setUserPet(const UserPet(
      id: 0,
      userID: 0,
      petID: 0,
      accessoryID: 0,
      health: 100,
      hunger: 100,
      exp: 25,
      name: "Pet A"));
  userPetDatabase.setUserPet(const UserPet(
      id: 1,
      userID: 0,
      petID: 0,
      accessoryID: 0,
      health: 100,
      hunger: 100,
      exp: 100,
      name: "Pet B"));
  userPetDatabase.setUserPet(const UserPet(
      id: 2,
      userID: 1,
      petID: 0,
      accessoryID: 0,
      health: 100,
      hunger: 100,
      exp: 100,
      name: "Pet A"));

  StoreDatabase storeDatabase = ref.watch(storeDatabaseProvider);
  storeDatabase.setStore(const Store(id: 0, type: 0, itemID: 2, cost: 10));
  storeDatabase.setStore(const Store(id: 1, type: 1, itemID: 0, cost: 10));

  PetDatabase petDatabase = ref.watch(petDatabaseProvider);
  petDatabase.setPet(const Pet(
      id: 0,
      name: "Test Pet",
      description: "A Friendly Companion",
      maxHealth: 100,
      maxHunger: 100,
      maxExp: 100,
      asset: "images/pet_test.png"));
  petDatabase.setPet(const Pet(
      id: 1,
      name: "Test Pet 2",
      description: "A Friendly Companion",
      maxHealth: 100,
      maxHunger: 100,
      maxExp: 100,
      asset: "images/pet_test.png"));

  AccessoryDatabase accessoryDatabase = ref.watch(accessoryDatabaseProvider);
  accessoryDatabase.setAccessory(const Accessory(
      id: 0, name: "None", description: "None", asset: "images/empty.png"));
  accessoryDatabase.setAccessory(const Accessory(
      id: 1,
      name: "Red Cap",
      description: "A Red Cap",
      asset: "images/red_cap.png"));
  accessoryDatabase.setAccessory(const Accessory(
      id: 2,
      name: "Top Hat",
      description: "A Top Hat",
      asset: "images/top_hat.png"));

  print("database rewrote");
}
