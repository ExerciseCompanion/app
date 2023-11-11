import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/store.dart';

// Provides access to the Firestore database storing Store documents.
class StoreDatabase {
  StoreDatabase(this.ref);

  final ProviderRef<StoreDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Store>> watchStores() => _service.watchCollection(
      path: FirestorePath.stores(),
      builder: (data, documentId) => Store.fromJson(data!));

  Stream<Store> watchStore(int storeId) => _service.watchDocument(
      path: FirestorePath.store(storeId),
      builder: (data, documentId) => Store.fromJson(data!));

  Future<List<Store>> fetchStores() => _service.fetchCollection(
      path: FirestorePath.stores(),
      builder: (data, documentId) => Store.fromJson(data!));

  Future<Store> fetchStore(int storeId) => _service.fetchDocument(
      path: FirestorePath.store(storeId),
      builder: (data, documentId) => Store.fromJson(data!));

  Future<void> setStore(Store store) => _service.setData(
      path: FirestorePath.store(store.id), data: store.toJson());
}
