import 'package:hive/hive.dart';
import '/core/constants/tracked_items.dart';

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
}
