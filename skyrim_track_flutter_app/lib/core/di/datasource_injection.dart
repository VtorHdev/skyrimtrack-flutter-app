import 'package:get_it/get_it.dart';
import 'package:skyrim_completionist_app/data/datasources/local/houses_local_datasource.dart';
import 'package:skyrim_completionist_app/data/datasources/local/shouts_local_datasource.dart';
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

    getIt.registerLazySingleton<HousesLocalDatasource>(
      () => HousesLocalDatasourceImpl(getIt<LocalStorageService>()),
    );

    getIt.registerLazySingleton<ShoutsLocalDatasource>(
      () => ShoutsLocalDatasourceImpl(getIt<LocalStorageService>()),
    );
  }
}
