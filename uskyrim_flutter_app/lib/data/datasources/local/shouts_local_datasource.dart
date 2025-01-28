import 'dart:convert';
import 'package:flutter/services.dart';
import '/domain/entities/shout.dart';
import '/core/constants/tracked_items.dart';
import '/core/services/local_storage_service.dart';

abstract class ShoutsLocalDatasource {
  Future<List<Shout>> getAll();
  Future<void> toggleWord(String id);
}

class ShoutsLocalDatasourceImpl implements ShoutsLocalDatasource {
  final LocalStorageService _storage;
  final _jsonPath = 'assets/json/shouts.json';
  final _jsonKey = 'shouts';

  ShoutsLocalDatasourceImpl(this._storage);

  @override
  Future<List<Shout>> getAll() async {
    try {
      final jsonString = await rootBundle.loadString(_jsonPath);
      final json = jsonDecode(jsonString);
      final List<dynamic> jsonList = json[_jsonKey];
      final wordsLearned = _storage.getWordsLearned(TrackedItem.shouts);

      return jsonList
          .map((json) =>
              Shout.fromJson(json, wordsLearned: wordsLearned[json['id']] ?? 0))
          .toList();
    } catch (e) {
      throw Exception('Error loading shouts: $e');
    }
  }

  @override
  Future<void> toggleWord(String id) async {
    await _storage.toggleWordLearned(TrackedItem.shouts, id);
  }
}
