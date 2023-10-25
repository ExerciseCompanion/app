import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/user_steps_db.dart';

final userStepsDBProvider = Provider<UserStepsDB>((ref) {
  return UserStepsDB(ref);
});
