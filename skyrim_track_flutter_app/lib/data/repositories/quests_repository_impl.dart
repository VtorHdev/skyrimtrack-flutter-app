import '/domain/entities/quest.dart';
import '/domain/enums/quest_type.dart';
import '/domain/repositories/quests_repository.dart';
import '/data/datasources/local/quests_local_datasource.dart';

class QuestsRepositoryImpl implements QuestsRepository {
  final QuestsLocalDatasource _localDatasource;

  QuestsRepositoryImpl(this._localDatasource);

  @override
  Future<List<Quest>> getQuests(QuestType type) {
    return _localDatasource.getQuests(type);
  }

  @override
  Future<void> toggleMarked(QuestType type, String id) {
    return _localDatasource.toggleQuestCompleted(type, id);
  }
}
