import 'dart:convert';
import 'package:flutter/services.dart';
import '/domain/entities/quest.dart';
import '/domain/enums/quest_type.dart';
import '/core/constants/tracked_items.dart';
import '/core/services/local_storage_service.dart';

abstract class QuestsLocalDatasource {
  Future<List<Quest>> getQuests(QuestType type);
  Future<void> toggleQuestCompleted(QuestType type, String id);
}

class QuestsLocalDatasourceImpl implements QuestsLocalDatasource {
  final LocalStorageService _storage;
  final _questFiles = {
    QuestType.main: 'assets/json/main_quests.json',
    QuestType.civilWar: 'assets/json/civil_war_quests.json',
    QuestType.companions: 'assets/json/companions_quests.json',
    QuestType.darkBrotherhood: 'assets/json/dark_brotherhood_quests.json',
    QuestType.thievesGuild: 'assets/json/thieves_guild_quests.json',
    QuestType.winterhold: 'assets/json/winterhold_quests.json',
    QuestType.daedric: 'assets/json/daedric_quests.json',
  };

  QuestsLocalDatasourceImpl(this._storage);

  TrackedItem _getTrackedItem(QuestType type) {
    switch (type) {
      case QuestType.main:
        return TrackedItem.mainQuests;
      case QuestType.winterhold:
        return TrackedItem.winterholdQuests;
      case QuestType.darkBrotherhood:
        return TrackedItem.darkBrotherhoodQuests;
      case QuestType.thievesGuild:
        return TrackedItem.thievesQuests;
      case QuestType.daedric:
        return TrackedItem.daedricQuests;
      case QuestType.companions:
        return TrackedItem.companionsQuests;
      case QuestType.civilWar:
        return TrackedItem.civilWarQuests;
    }
  }

  @override
  Future<List<Quest>> getQuests(QuestType type) async {
    final filePath = _questFiles[type];
    if (filePath == null) throw Exception('Quest type not supported: $type');

    try {
      final jsonString = await rootBundle.loadString(filePath);
      final json = jsonDecode(jsonString);
      final List<dynamic> questsJson = json['quests'];
      final completedIds = _storage.getMarkedIds(_getTrackedItem(type));

      return questsJson
          .map((questJson) => Quest(
                id: questJson['id'],
                name: questJson['name'],
                description: questJson['description'],
                location: questJson['location'] ?? '',
                prerequisite: questJson['prerequisite'] ?? '',
                isCompleted: completedIds.contains(questJson['id']),
              ))
          .toList();
    } catch (e) {
      throw Exception('Error loading quests: $e');
    }
  }

  @override
  Future<void> toggleQuestCompleted(QuestType type, String id) async {
    await _storage.toggleMarkedId(_getTrackedItem(type), id);
  }
}
