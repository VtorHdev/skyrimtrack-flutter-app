import 'dart:convert';
import 'package:flutter/services.dart';
import '/domain/entities/enchantment.dart';
import '/core/constants/tracked_items.dart';
import '/core/services/local_storage_service.dart';

abstract class EnchantmentsLocalDatasource {
  Future<List<Enchantment>> getAll();
  Future<void> toggleMarked(String id);
}

class EnchantmentsLocalDatasourceImpl implements EnchantmentsLocalDatasource {
  final LocalStorageService _storage;
  final _jsonPath = 'assets/json/enchantments.json';
  final _jsonKey = 'enchantments';

  EnchantmentsLocalDatasourceImpl(this._storage);

  @override
  Future<List<Enchantment>> getAll() async {
    try {
      final jsonString = await rootBundle.loadString(_jsonPath);
      final json = jsonDecode(jsonString);
      final List<dynamic> jsonList = json[_jsonKey];
      final markedIds = _storage.getMarkedIds(TrackedItem.enchantments);

      return jsonList
          .map((json) => Enchantment.fromJson(json,
              isLearned: markedIds.contains(json['id'])))
          .toList();
    } catch (e) {
      throw Exception('Error loading enchantments: $e');
    }
  }

  @override
  Future<void> toggleMarked(String id) async {
    await _storage.toggleMarkedId(TrackedItem.enchantments, id);
  }
}
