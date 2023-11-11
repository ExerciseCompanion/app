import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'chapter/data/chapter_provider.dart';
import 'garden/data/garden_provider.dart';
import 'news/data/news_provider.dart';
import 'user/data/user_providers.dart';

import 'user/domain/user.dart';
import 'user/domain/user_step.dart';
import 'pet/domain/pet.dart';
import 'pet/domain/user_pet.dart';
import 'store/domain/store.dart';
import 'task/domain/user_task.dart';
import 'accessory/domain/accessory.dart';

part 'all_data_provider.g.dart';

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
}

@riverpod
Future<AllData> allData(AllDataRef ref) async {
  final chapters = ref.watch(chaptersProvider.future);
  final gardens = ref.watch(gardensProvider.future);
  final users = ref.watch(usersProvider.future);
  final news = ref.watch(newsProvider.future);
  final currentUserID = ref.watch(currentUserIDProvider);
  return AllData(
      chapters: await chapters,
      gardens: await gardens,
      users: await users,
      news: await news,
      currentUserID: currentUserID);
}
