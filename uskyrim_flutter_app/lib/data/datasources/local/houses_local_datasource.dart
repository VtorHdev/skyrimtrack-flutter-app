import 'dart:convert';
import 'package:flutter/services.dart';
import '/domain/entities/house.dart';
import '/core/constants/tracked_items.dart';
import '/core/services/local_storage_service.dart';

abstract class HousesLocalDatasource {
  Future<List<House>> getAll();
  Future<void> toggleMarked(String id);
}

class HousesLocalDatasourceImpl implements HousesLocalDatasource {
  final LocalStorageService _storage;
  final _jsonPath = 'assets/json/houses.json';
  final _jsonKey = 'houses';

  HousesLocalDatasourceImpl(this._storage);

  @override
  Future<List<House>> getAll() async {
    try {
      final jsonString = await rootBundle.loadString(_jsonPath);
      final json = jsonDecode(jsonString);
      final List<dynamic> jsonList = json[_jsonKey];
      final markedIds = _storage.getMarkedIds(TrackedItem.houses);

      return jsonList
          .map((json) =>
              House.fromJson(json, isAcquired: markedIds.contains(json['id'])))
          .toList();
    } catch (e) {
      throw Exception('Error loading houses: $e');
    }
  }

  @override
  Future<void> toggleMarked(String id) async {
    await _storage.toggleMarkedId(TrackedItem.houses, id);
  }
}
