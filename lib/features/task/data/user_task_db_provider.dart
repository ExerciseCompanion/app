import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/user_task_db.dart';

final userTasksDBProvider = Provider<UserTaskDB>((ref) {
  return UserTaskDB(ref);
});
