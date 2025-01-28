import '/domain/entities/house.dart';
import '/domain/repositories/houses_repository.dart';
import '/data/datasources/local/houses_local_datasource.dart';

class HousesRepositoryImpl implements HousesRepository {
  final HousesLocalDatasource _localDatasource;

  HousesRepositoryImpl(this._localDatasource);

  @override
  Future<List<House>> getAll() {
    return _localDatasource.getAll();
  }

  @override
  Future<void> toggleMarked(String id) {
    return _localDatasource.toggleMarked(id);
  }
}
