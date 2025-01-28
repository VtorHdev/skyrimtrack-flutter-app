import '/domain/entities/quest.dart';
import '/domain/enums/quest_type.dart';

abstract class QuestsRepository {
  Future<List<Quest>> getQuests(QuestType type);
  Future<void> toggleMarked(QuestType type, String id);
}
