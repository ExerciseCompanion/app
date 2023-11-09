import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/store_db.dart.delete';

final storeDBProvider = Provider<StoreDB>((ref) {
  return StoreDB(ref);
});
