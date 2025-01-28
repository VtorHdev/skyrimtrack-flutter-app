import '/domain/entities/shout.dart';
import '/domain/repositories/shouts_repository.dart';
import '/data/datasources/local/shouts_local_datasource.dart';

class ShoutsRepositoryImpl implements ShoutsRepository {
  final ShoutsLocalDatasource _localDatasource;

  ShoutsRepositoryImpl(this._localDatasource);

  @override
  Future<List<Shout>> getAll() {
    return _localDatasource.getAll();
  }

  @override
  Future<void> toggleWord(String id) {
    return _localDatasource.toggleWord(id);
  }
}
