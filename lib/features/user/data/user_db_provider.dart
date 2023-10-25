import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/user_db.dart';

final userDBProvider = Provider<UserDB>((ref) {
  return UserDB(ref);
});

final currentUserIDProvider = StateProvider<int>((ref) {
  return 0;
});
