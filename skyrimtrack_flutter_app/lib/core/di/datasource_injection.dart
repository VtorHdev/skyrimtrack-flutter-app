import 'package:get_it/get_it.dart';
import '/data/datasources/local/enchantments_local_datasource.dart';
import '/data/datasources/local/skill_books_local_datasource.dart';
import '/data/datasources/local/main_quests_local_datasource.dart';
import '/data/datasources/local/winterhold_quests_local_datasource.dart';
import '/data/datasources/local/dark_brotherhood_quests_local_datasource.dart';
import '/data/datasources/local/companions_quests_local_datasource.dart';
import '/data/datasources/local/thieves_guild_quests_local_datasource.dart';
import '/data/datasources/local/civil_war_quests_local_datasource.dart';
import '/data/datasources/local/daedric_quests_local_datasource.dart';

class DatasourceInjection {
  static Future<void> init() async {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<EnchantmentsLocalDatasource>(
      () => EnchantmentsLocalDatasourceImpl(),
    );

    getIt.registerLazySingleton<SkillBooksLocalDatasource>(
      () => SkillBooksLocalDatasourceImpl(),
    );

    // Quest Datasources
    getIt.registerLazySingleton<MainQuestsLocalDatasource>(
      () => MainQuestsLocalDatasourceImpl(),
    );

    getIt.registerLazySingleton<WinterholdQuestsLocalDatasource>(
      () => WinterholdQuestsLocalDatasourceImpl(),
    );

    getIt.registerLazySingleton<DarkBrotherhoodQuestsLocalDatasource>(
      () => DarkBrotherhoodQuestsLocalDatasourceImpl(),
    );

    getIt.registerLazySingleton<CompanionsQuestsLocalDatasource>(
      () => CompanionsQuestsLocalDatasourceImpl(),
    );

    getIt.registerLazySingleton<ThievesGuildQuestsLocalDatasource>(
      () => ThievesGuildQuestsLocalDatasourceImpl(),
    );

    getIt.registerLazySingleton<CivilWarQuestsLocalDatasource>(
      () => CivilWarQuestsLocalDatasourceImpl(),
    );

    getIt.registerLazySingleton<DaedricQuestsLocalDatasource>(
      () => DaedricQuestsLocalDatasourceImpl(),
    );
  }
}
