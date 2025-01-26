import 'package:get_it/get_it.dart';
import 'package:skyrim_completionist_app/data/datasources/local/civil_war_quests_local_datasource.dart';
import 'package:skyrim_completionist_app/data/datasources/local/companions_quests_local_datasource.dart';
import 'package:skyrim_completionist_app/data/datasources/local/daedric_quests_local_datasource.dart';
import 'package:skyrim_completionist_app/data/datasources/local/dark_brotherhood_quests_local_datasource.dart';
import 'package:skyrim_completionist_app/data/datasources/local/enchantments_local_datasource.dart';
import 'package:skyrim_completionist_app/data/datasources/local/main_quests_local_datasource.dart';
import 'package:skyrim_completionist_app/data/datasources/local/skill_books_local_datasource.dart';
import 'package:skyrim_completionist_app/data/datasources/local/thieves_guild_quests_local_datasource.dart';
import 'package:skyrim_completionist_app/data/datasources/local/winterhold_quests_local_datasource.dart';
import '/data/repositories/enchantments_repository_impl.dart';
import '/data/repositories/skill_books_repository_impl.dart';
import '/data/repositories/quests_repository_impl.dart';
import '/domain/repositories/enchantments_repository.dart';
import '/domain/repositories/skill_books_repository.dart';
import '/domain/repositories/quests_repository.dart';

class RepositoryInjection {
  static QuestsRepository get questsRepository =>
      GetIt.instance.get<QuestsRepository>();

  static Future<void> init() async {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<EnchantmentsRepository>(
      () => EnchantmentsRepositoryImpl(getIt<EnchantmentsLocalDatasource>()),
    );

    getIt.registerLazySingleton<SkillBooksRepository>(
      () => SkillBooksRepositoryImpl(getIt<SkillBooksLocalDatasource>()),
    );

    getIt.registerLazySingleton<QuestsRepository>(
      () => QuestsRepositoryImpl(
        mainQuestsDataSource: getIt<MainQuestsLocalDatasource>(),
        winterholdQuestsDataSource: getIt<WinterholdQuestsLocalDatasource>(),
        darkBrotherhoodQuestsDataSource:
            getIt<DarkBrotherhoodQuestsLocalDatasource>(),
        companionsQuestsDataSource: getIt<CompanionsQuestsLocalDatasource>(),
        thievesGuildQuestsDataSource:
            getIt<ThievesGuildQuestsLocalDatasource>(),
        civilWarQuestsDataSource: getIt<CivilWarQuestsLocalDatasource>(),
        daedricQuestsDataSource: getIt<DaedricQuestsLocalDatasource>(),
      ),
    );
  }
}
