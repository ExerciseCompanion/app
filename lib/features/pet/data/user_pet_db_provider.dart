import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/user_pets_db.dart';

final userPetDBProvider = Provider<UserPetDB>((ref) {
  return UserPetDB(ref);
});
