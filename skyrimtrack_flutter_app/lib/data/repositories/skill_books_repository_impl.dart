import '/domain/entities/skill_book.dart';
import '/domain/repositories/skill_books_repository.dart';
import '/data/datasources/local/skill_books_local_datasource.dart';

class SkillBooksRepositoryImpl implements SkillBooksRepository {
  final SkillBooksLocalDatasource _localDatasource;

  SkillBooksRepositoryImpl(this._localDatasource);

  @override
  List<SkillBook> getSkillBooks() {
    return _localDatasource.getSkillBooks();
  }
}
