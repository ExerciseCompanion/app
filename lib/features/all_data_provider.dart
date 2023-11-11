import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'accessory/data/accessory_provider.dart';
//import 'chapter/data/chapter_provider.dart';
//import 'garden/data/garden_provider.dart';
//import 'news/data/news_provider.dart';
import 'pet/data/pet_provider.dart';
import 'pet/data/user_pet_provider.dart';
import 'store/data/store_provider.dart';
import 'task/data/user_task_provider.dart';
import 'user/data/user_provider.dart';
//import 'user/data/user_providers.dart';

import 'user/data/user_step_provider.dart';
import 'user/domain/user.dart';
import 'user/domain/user_step.dart';
import 'pet/domain/pet.dart';
import 'pet/domain/user_pet.dart';
import 'store/domain/store.dart';
import 'task/domain/user_task.dart';
import 'accessory/domain/accessory.dart';

//part 'all_data_provider.g.dart';

// Based on: https://stackoverflow.com/questions/69929734/combining-futureproviders-using-a-futureprovider-riverpod

class AllData {
  AllData(
      {required this.users,
      required this.userSteps,
      required this.userTasks,
      required this.userPets,
      required this.pets,
      required this.stores,
      required this.accessories,
      required this.currentUserID});

  final List<User> users;
  final List<UserStep> userSteps;
  final List<UserTask> userTasks;
  final List<UserPet> userPets;
  final List<Pet> pets;
  final List<Store> stores;
  final List<Accessory> accessories;
  final int currentUserID;

  static AllData empty() {
    return AllData(
        users: List.empty(),
        userSteps: List.empty(),
        userTasks: List.empty(),
        userPets: List.empty(),
        pets: List.empty(),
        stores: List.empty(),
        accessories: List.empty(),
        currentUserID: 0);
  }
}

final allDataProvider = FutureProvider((ref) async {
  final users = ref.watch(usersProvider.future);
  final userSteps = ref.watch(userStepsProvider.future);
  final userTasks = ref.watch(userTasksProvider.future);
  final userPets = ref.watch(userPetsProvider.future);
  final pets = ref.watch(petsProvider.future);
  final stores = ref.watch(storesProvider.future);
  final accessories = ref.watch(accessoriesProvider.future);

  final currentUserID = ref.watch(currentUserIDProvider);
  return AllData(
      users: await users,
      userSteps: await userSteps,
      userTasks: await userTasks,
      userPets: await userPets,
      pets: await pets,
      stores: await stores,
      accessories: await accessories,
      currentUserID: currentUserID);
});



// @riverpod
// Future<AllData> allData(AllDataRef ref) async {
//   final chapters = ref.watch(chaptersProvider.future);
//   final gardens = ref.watch(gardensProvider.future);
//   final users = ref.watch(usersProvider.future);
//   final news = ref.watch(newsProvider.future);
//   final currentUserID = ref.watch(currentUserIDProvider);
//   return AllData(
//       chapters: await chapters,
//       gardens: await gardens,
//       users: await users,
//       news: await news,
//       currentUserID: currentUserID);
// }
