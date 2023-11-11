import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/user_step.dart';
import 'user_step_database.dart';

// final userStepsDBProvider = Provider<UserStepsDB>((ref) {
//   return UserStepsDB(ref);
// });

final userStepDatabaseProvider = Provider<UserStepDatabase>((ref) {
  return UserStepDatabase(ref);
});

final userStepsProvider = StreamProvider<List<UserStep>>((ref) {
  final database = ref.watch(userStepDatabaseProvider);
  return database.watchUserSteps();
});
