import '/domain/entities/skill_book.dart';

abstract class SkillBooksRepository {
  Future<List<SkillBook>> getSkillBooks();
  Future<void> toggleBookRead(String id);
}
