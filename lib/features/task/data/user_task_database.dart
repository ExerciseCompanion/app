import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/user_task.dart';

// Provides access to the Firestore database storing UserTask documents.
class UserTaskDatabase {
  UserTaskDatabase(this.ref);

  final ProviderRef<UserTaskDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<UserTask>> watchUserTasks() => _service.watchCollection(
      path: FirestorePath.userTasks(),
      builder: (data, documentId) => UserTask.fromJson(data!));

  Stream<UserTask> watchUserTask(int userTaskId) => _service.watchDocument(
      path: FirestorePath.userTask(userTaskId),
      builder: (data, documentId) => UserTask.fromJson(data!));

  Future<List<UserTask>> fetchUserTasks() => _service.fetchCollection(
      path: FirestorePath.userTasks(),
      builder: (data, documentId) => UserTask.fromJson(data!));

  Future<UserTask> fetchUserTask(int userTaskId) => _service.fetchDocument(
      path: FirestorePath.userTask(userTaskId),
      builder: (data, documentId) => UserTask.fromJson(data!));

  Future<void> setUserTask(UserTask userTask) => _service.setData(
      path: FirestorePath.userTask(userTask.id), data: userTask.toJson());
}
