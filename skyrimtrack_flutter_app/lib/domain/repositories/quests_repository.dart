import '/domain/entities/quest.dart';

abstract class QuestsRepository {
  List<Quest> getMainQuests();
  List<Quest> getWinterholdQuests();
  List<Quest> getDarkBrotherhoodQuests();
  List<Quest> getCompanionsQuests();
  List<Quest> getThievesGuildQuests();
  List<Quest> getCivilWarQuests();
  List<Quest> getDaedricQuests();
}
