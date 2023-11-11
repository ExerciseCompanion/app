// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../domain/accessory_db.dart';

// final accessoryDBProvider = Provider<AccessoryDB>((ref) {
//   return AccessoryDB();
// });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/accessory.dart';
import 'accessory_database.dart';

final accessoryDatabaseProvider = Provider<AccessoryDatabase>((ref) {
  return AccessoryDatabase(ref);
});

final accessoriesProvider = StreamProvider<List<Accessory>>((ref) {
  final database = ref.watch(accessoryDatabaseProvider);
  return database.watchAccessorys();
});
