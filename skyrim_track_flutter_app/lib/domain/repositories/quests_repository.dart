import '/domain/entities/quest.dart';
import '/domain/enums/quest_type.dart';

abstract class QuestsRepository {
  Future<List<Quest>> getMainQuests();
  Future<List<Quest>> getWinterholdQuests();
  Future<List<Quest>> getDarkBrotherhoodQuests();
  Future<List<Quest>> getCompanionsQuests();
  Future<List<Quest>> getThievesGuildQuests();
  Future<List<Quest>> getCivilWarQuests();
  Future<List<Quest>> getDaedricQuests();
  Future<void> toggleQuestCompleted(QuestType type, String id);
}
