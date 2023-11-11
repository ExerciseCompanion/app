import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/user_task.dart';
import 'user_task_database.dart';

final userTaskDatabaseProvider = Provider<UserTaskDatabase>((ref) {
  return UserTaskDatabase(ref);
});

final userTasksProvider = StreamProvider<List<UserTask>>((ref) {
  final database = ref.watch(userTaskDatabaseProvider);
  return database.watchUserTasks();
});
