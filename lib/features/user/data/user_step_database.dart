import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/user_step.dart';

// Provides access to the Firestore database storing UserStep documents.
class UserStepDatabase {
  UserStepDatabase(this.ref);

  final ProviderRef<UserStepDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<UserStep>> watchUserSteps() => _service.watchCollection(
      path: FirestorePath.userSteps(),
      builder: (data, documentId) => UserStep.fromJson(data!));

  Stream<UserStep> watchUserStep(int userStepId) => _service.watchDocument(
      path: FirestorePath.userStep(userStepId),
      builder: (data, documentId) => UserStep.fromJson(data!));

  Future<List<UserStep>> fetchUserSteps() => _service.fetchCollection(
      path: FirestorePath.userSteps(),
      builder: (data, documentId) => UserStep.fromJson(data!));

  Future<UserStep> fetchUserStep(int userStepId) => _service.fetchDocument(
      path: FirestorePath.userStep(userStepId),
      builder: (data, documentId) => UserStep.fromJson(data!));

  Future<void> setUserStep(UserStep userStep) => _service.setData(
      path: FirestorePath.userStep(userStep.id), data: userStep.toJson());
}
