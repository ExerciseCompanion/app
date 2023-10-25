import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/pet_db.dart';

final petDBProvider = Provider<PetDB>((ref) {
  return PetDB();
});
