import '/domain/entities/enchantment.dart';
import '/domain/repositories/enchantments_repository.dart';
import '/data/datasources/local/enchantments_local_datasource.dart';

class EnchantmentsRepositoryImpl implements EnchantmentsRepository {
  final EnchantmentsLocalDatasource _localDatasource;

  EnchantmentsRepositoryImpl(this._localDatasource);

  @override
  Future<List<Enchantment>> getAll() {
    return _localDatasource.getAll();
  }

  @override
  Future<void> toggleMarked(String id) {
    return _localDatasource.toggleMarked(id);
  }
}
