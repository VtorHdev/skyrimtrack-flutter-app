import 'dart:convert';
import 'package:flutter/services.dart';
import '/domain/entities/enchantment.dart';
import '/core/constants/tracked_items.dart';
import '/core/services/local_storage_service.dart';

abstract class EnchantmentsLocalDatasource {
  Future<List<Enchantment>> getEnchantments();
  Future<void> toggleEnchantmentLearned(String id);
}

class EnchantmentsLocalDatasourceImpl implements EnchantmentsLocalDatasource {
  final LocalStorageService _storage;

  EnchantmentsLocalDatasourceImpl(this._storage);

  @override
  Future<List<Enchantment>> getEnchantments() async {
    final jsonString =
        await rootBundle.loadString('assets/json/enchantments.json');
    final json = jsonDecode(jsonString);
    final List<dynamic> jsonList = json['enchantments'];
    final learnedIds = _storage.getMarkedIds(TrackedItem.enchantments);

    return jsonList
        .map((json) => Enchantment.fromJson(json,
            isLearned: learnedIds.contains(json['id'])))
        .toList();
  }

  @override
  Future<void> toggleEnchantmentLearned(String id) async {
    await _storage.toggleMarkedId(TrackedItem.enchantments, id);
  }
}
