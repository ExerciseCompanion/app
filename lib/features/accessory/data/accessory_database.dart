import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/accessory.dart';

// Provides access to the Firestore database storing Accessory documents.
class AccessoryDatabase {
  AccessoryDatabase(this.ref);

  final ProviderRef<AccessoryDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Accessory>> watchAccessorys() => _service.watchCollection(
      path: FirestorePath.accessories(),
      builder: (data, documentId) => Accessory.fromJson(data!));

  Stream<Accessory> watchAccessory(int accessoryId) => _service.watchDocument(
      path: FirestorePath.accessory(accessoryId),
      builder: (data, documentId) => Accessory.fromJson(data!));

  Future<List<Accessory>> fetchAccessorys() => _service.fetchCollection(
      path: FirestorePath.accessories(),
      builder: (data, documentId) => Accessory.fromJson(data!));

  Future<Accessory> fetchAccessory(int accessoryId) => _service.fetchDocument(
      path: FirestorePath.accessory(accessoryId),
      builder: (data, documentId) => Accessory.fromJson(data!));

  Future<void> setAccessory(Accessory accessory) => _service.setData(
      path: FirestorePath.accessory(accessory.id), data: accessory.toJson());
}
