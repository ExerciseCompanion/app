// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../domain/store_db.dart.delete';

// final storeDBProvider = Provider<StoreDB>((ref) {
//   return StoreDB(ref);
// });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/store.dart';
import 'store_database.dart';

final storeDatabaseProvider = Provider<StoreDatabase>((ref) {
  return StoreDatabase(ref);
});

final storesProvider = StreamProvider<List<Store>>((ref) {
  final database = ref.watch(storeDatabaseProvider);
  return database.watchStores();
});
