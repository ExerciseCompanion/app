import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/accessory_db.dart';

final accessoryDBProvider = Provider<AccessoryDB>((ref) {
  return AccessoryDB();
});
