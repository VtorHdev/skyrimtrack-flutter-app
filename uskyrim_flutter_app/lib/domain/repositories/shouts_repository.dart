import '/domain/entities/shout.dart';

abstract class ShoutsRepository {
  Future<List<Shout>> getAll();
  Future<void> toggleWord(String id);
}
