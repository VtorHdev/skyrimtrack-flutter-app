import 'dart:convert';
import 'package:flutter/services.dart';
import '/domain/entities/skill_book.dart';
import '/core/constants/tracked_items.dart';
import '/core/services/local_storage_service.dart';

abstract class SkillBooksLocalDatasource {
  Future<List<SkillBook>> getAll();
  Future<void> toggleMarked(String id);
}

class SkillBooksLocalDatasourceImpl implements SkillBooksLocalDatasource {
  final LocalStorageService _storage;
  final _jsonPath = 'assets/json/skill_books.json';
  final _jsonKey = 'skill_books';

  SkillBooksLocalDatasourceImpl(this._storage);

  @override
  Future<List<SkillBook>> getAll() async {
    try {
      final jsonString = await rootBundle.loadString(_jsonPath);
      final json = jsonDecode(jsonString);
      final List<dynamic> jsonList = json[_jsonKey];
      final markedIds = _storage.getMarkedIds(TrackedItem.skillBooks);

      return jsonList
          .map((json) =>
              SkillBook.fromJson(json, isRead: markedIds.contains(json['id'])))
          .toList();
    } catch (e) {
      throw Exception('Error loading skill books: $e');
    }
  }

  @override
  Future<void> toggleMarked(String id) async {
    await _storage.toggleMarkedId(TrackedItem.skillBooks, id);
  }
}
