import 'package:get_it/get_it.dart';
import '/core/services/local_storage_service.dart';
import '/data/datasources/local/enchantments_local_datasource.dart';
import '/data/datasources/local/skill_books_local_datasource.dart';
import '/data/datasources/local/quests_local_datasource.dart';

class DatasourceInjection {
  static Future<void> init() async {
    final getIt = GetIt.instance;

    // Registramos los datasources
    getIt.registerLazySingleton<SkillBooksLocalDatasource>(
      () => SkillBooksLocalDatasourceImpl(getIt<LocalStorageService>()),
    );

    getIt.registerLazySingleton<EnchantmentsLocalDatasource>(
      () => EnchantmentsLocalDatasourceImpl(getIt<LocalStorageService>()),
    );

    getIt.registerLazySingleton<QuestsLocalDatasource>(
      () => QuestsLocalDatasourceImpl(getIt<LocalStorageService>()),
    );
  }
}
