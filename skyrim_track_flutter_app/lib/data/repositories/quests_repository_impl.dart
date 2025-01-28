import '/domain/entities/quest.dart';
import '/domain/enums/quest_type.dart';
import '/domain/repositories/quests_repository.dart';
import '/data/datasources/local/quests_local_datasource.dart';

class QuestsRepositoryImpl implements QuestsRepository {
  final QuestsLocalDatasource _questsDataSource;

  QuestsRepositoryImpl(this._questsDataSource);

  @override
  Future<List<Quest>> getMainQuests() =>
      _questsDataSource.getQuests(QuestType.main);

  @override
  Future<List<Quest>> getWinterholdQuests() =>
      _questsDataSource.getQuests(QuestType.winterhold);

  @override
  Future<List<Quest>> getDarkBrotherhoodQuests() =>
      _questsDataSource.getQuests(QuestType.darkBrotherhood);

  @override
  Future<List<Quest>> getCompanionsQuests() =>
      _questsDataSource.getQuests(QuestType.companions);

  @override
  Future<List<Quest>> getThievesGuildQuests() =>
      _questsDataSource.getQuests(QuestType.thievesGuild);

  @override
  Future<List<Quest>> getCivilWarQuests() =>
      _questsDataSource.getQuests(QuestType.civilWar);

  @override
  Future<List<Quest>> getDaedricQuests() =>
      _questsDataSource.getQuests(QuestType.daedric);

  @override
  Future<void> toggleQuestCompleted(QuestType type, String id) =>
      _questsDataSource.toggleQuestCompleted(type, id);
}
