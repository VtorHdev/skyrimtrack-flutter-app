import '/domain/entities/skill_book.dart';

abstract class SkillBooksRepository {
  Future<List<SkillBook>> getAll();
  Future<void> toggleMarked(String id);
}
