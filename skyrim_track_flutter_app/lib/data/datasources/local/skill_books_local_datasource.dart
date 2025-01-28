import 'dart:convert';
import 'package:flutter/services.dart';
import '/domain/entities/skill_book.dart';
import '/core/constants/tracked_items.dart';
import '/core/services/local_storage_service.dart';

abstract class SkillBooksLocalDatasource {
  Future<List<SkillBook>> getSkillBooks();
  Future<void> toggleBookRead(String id);
}

class SkillBooksLocalDatasourceImpl implements SkillBooksLocalDatasource {
  final LocalStorageService _storage;

  SkillBooksLocalDatasourceImpl(this._storage);

  @override
  Future<List<SkillBook>> getSkillBooks() async {
    final jsonString =
        await rootBundle.loadString('assets/json/skill_books.json');
    final json = jsonDecode(jsonString);
    final List<dynamic> jsonList = json['skill_books'];
    final readIds = _storage.getMarkedIds(TrackedItem.skillBooks);

    return jsonList
        .map((json) =>
            SkillBook.fromJson(json, isRead: readIds.contains(json['id'])))
        .toList();
  }

  @override
  Future<void> toggleBookRead(String id) async {
    await _storage.toggleMarkedId(TrackedItem.skillBooks, id);
  }
}
