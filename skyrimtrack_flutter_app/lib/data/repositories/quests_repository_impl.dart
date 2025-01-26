import '/domain/entities/quest.dart';
import '/domain/repositories/quests_repository.dart';
import '/data/datasources/local/main_quests_local_datasource.dart';
import '/data/datasources/local/winterhold_quests_local_datasource.dart';
import '/data/datasources/local/dark_brotherhood_quests_local_datasource.dart';
import '/data/datasources/local/companions_quests_local_datasource.dart';
import '/data/datasources/local/thieves_guild_quests_local_datasource.dart';
import '/data/datasources/local/civil_war_quests_local_datasource.dart';
import '/data/datasources/local/daedric_quests_local_datasource.dart';

class QuestsRepositoryImpl implements QuestsRepository {
  final MainQuestsLocalDatasource _mainQuestsDataSource;
  final WinterholdQuestsLocalDatasource _winterholdQuestsDataSource;
  final DarkBrotherhoodQuestsLocalDatasource _darkBrotherhoodQuestsDataSource;
  final CompanionsQuestsLocalDatasource _companionsQuestsDataSource;
  final ThievesGuildQuestsLocalDatasource _thievesGuildQuestsDataSource;
  final CivilWarQuestsLocalDatasource _civilWarQuestsDataSource;
  final DaedricQuestsLocalDatasource _daedricQuestsDataSource;

  QuestsRepositoryImpl({
    required MainQuestsLocalDatasource mainQuestsDataSource,
    required WinterholdQuestsLocalDatasource winterholdQuestsDataSource,
    required DarkBrotherhoodQuestsLocalDatasource
        darkBrotherhoodQuestsDataSource,
    required CompanionsQuestsLocalDatasource companionsQuestsDataSource,
    required ThievesGuildQuestsLocalDatasource thievesGuildQuestsDataSource,
    required CivilWarQuestsLocalDatasource civilWarQuestsDataSource,
    required DaedricQuestsLocalDatasource daedricQuestsDataSource,
  })  : _mainQuestsDataSource = mainQuestsDataSource,
        _winterholdQuestsDataSource = winterholdQuestsDataSource,
        _darkBrotherhoodQuestsDataSource = darkBrotherhoodQuestsDataSource,
        _companionsQuestsDataSource = companionsQuestsDataSource,
        _thievesGuildQuestsDataSource = thievesGuildQuestsDataSource,
        _civilWarQuestsDataSource = civilWarQuestsDataSource,
        _daedricQuestsDataSource = daedricQuestsDataSource;

  @override
  List<Quest> getMainQuests() => _mainQuestsDataSource.getMainQuests();

  @override
  List<Quest> getWinterholdQuests() =>
      _winterholdQuestsDataSource.getWinterholdQuests();

  @override
  List<Quest> getDarkBrotherhoodQuests() =>
      _darkBrotherhoodQuestsDataSource.getDarkBrotherhoodQuests();

  @override
  List<Quest> getCompanionsQuests() =>
      _companionsQuestsDataSource.getCompanionsQuests();

  @override
  List<Quest> getThievesGuildQuests() =>
      _thievesGuildQuestsDataSource.getThievesGuildQuests();

  @override
  List<Quest> getCivilWarQuests() =>
      _civilWarQuestsDataSource.getCivilWarQuests();

  @override
  List<Quest> getDaedricQuests() => _daedricQuestsDataSource.getDaedricQuests();
}
