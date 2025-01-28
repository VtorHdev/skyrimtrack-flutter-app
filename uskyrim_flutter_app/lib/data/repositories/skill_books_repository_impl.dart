import '/domain/entities/skill_book.dart';
import '/domain/repositories/skill_books_repository.dart';
import '/data/datasources/local/skill_books_local_datasource.dart';

class SkillBooksRepositoryImpl implements SkillBooksRepository {
  final SkillBooksLocalDatasource _localDatasource;

  SkillBooksRepositoryImpl(this._localDatasource);

  @override
  Future<List<SkillBook>> getAll() {
    return _localDatasource.getAll();
  }

  @override
  Future<void> toggleMarked(String id) {
    return _localDatasource.toggleMarked(id);
  }
}
