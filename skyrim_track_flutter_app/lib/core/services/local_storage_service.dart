import 'package:hive/hive.dart';
import '/core/constants/tracked_items.dart';
import 'dart:convert';

class LocalStorageService {
  final Box<List<String>> _box;

  LocalStorageService(this._box);

  List<String> getMarkedIds(TrackedItem type) {
    return _box.get(type.key, defaultValue: []) ?? [];
  }

  Future<void> toggleMarkedId(TrackedItem type, String id) async {
    final ids = getMarkedIds(type);
    if (ids.contains(id)) {
      ids.remove(id);
    } else {
      ids.add(id);
    }
    await _box.put(type.key, ids);
  }

  Map<String, int> getWordsLearned(TrackedItem item) {
    final data = _box.get(item.key);
    if (data == null || data.isEmpty) return {};

    try {
      final decoded = jsonDecode(data.first);
      return Map<String, int>.from(decoded).map(
          (key, value) => MapEntry(key, (value as num).clamp(0, 3).toInt()));
    } catch (e) {
      return {};
    }
  }

  Future<void> toggleWordLearned(TrackedItem item, String id) async {
    final wordsLearned = getWordsLearned(item);
    final currentCount = wordsLearned[id] ?? 0;

    if (currentCount >= 3) {
      wordsLearned[id] = 0;
    } else {
      wordsLearned[id] = (currentCount + 1).clamp(0, 3);
    }

    await _box.put(item.key, [jsonEncode(wordsLearned)]);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}
