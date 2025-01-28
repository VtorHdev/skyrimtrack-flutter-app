import 'package:get_it/get_it.dart';
import '/data/repositories/enchantments_repository_impl.dart';
import '/data/repositories/skill_books_repository_impl.dart';
import '/data/repositories/quests_repository_impl.dart';
import '/domain/repositories/enchantments_repository.dart';
import '/domain/repositories/skill_books_repository.dart';
import '/domain/repositories/quests_repository.dart';
import '/data/datasources/local/enchantments_local_datasource.dart';
import '/data/datasources/local/skill_books_local_datasource.dart';
import '/data/datasources/local/quests_local_datasource.dart';

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
      () => QuestsRepositoryImpl(getIt<QuestsLocalDatasource>()),
    );
  }
}
