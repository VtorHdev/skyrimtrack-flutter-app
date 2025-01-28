import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyrim_completionist_app/domain/entities/quest.dart';
import '/domain/enums/quest_type.dart';
import '/domain/enums/quest_sort.dart';
import '/domain/repositories/quests_repository.dart';
import 'quests_state.dart';

class QuestsCubit extends Cubit<QuestsState> {
  final QuestsRepository _repository;
  final QuestType _questType;

  QuestsCubit(this._repository, this._questType)
      : super(const QuestsState.initial()) {
    loadQuests();
  }

  Future<void> loadQuests() async {
    emit(const QuestsState.loading());
    try {
      final quests = switch (_questType) {
        QuestType.main => await _repository.getMainQuests(),
        QuestType.winterhold => await _repository.getWinterholdQuests(),
        QuestType.darkBrotherhood =>
          await _repository.getDarkBrotherhoodQuests(),
        QuestType.companions => await _repository.getCompanionsQuests(),
        QuestType.thievesGuild => await _repository.getThievesGuildQuests(),
        QuestType.civilWar => await _repository.getCivilWarQuests(),
        QuestType.daedric => await _repository.getDaedricQuests(),
      };
      emit(QuestsState.loaded(quests: quests));
    } catch (e) {
      emit(QuestsState.error(e.toString()));
    }
  }

  bool isQuestEnabled(Quest quest, List<Quest> allQuests) {
    // Si no tiene prerequisito, está habilitada
    if (quest.prerequisite == 'Ninguno') return true;

    // Busca la misión prerequisito
    final prerequisiteQuest = allQuests.firstWhere(
      (q) => q.name == quest.prerequisite,
      orElse: () => quest, // Si no encuentra, devuelve la misma misión
    );

    // La misión está habilitada si su prerequisito está completado
    return prerequisiteQuest.isCompleted;
  }

  List<Quest> getFilteredAndSortedQuests() {
    return state.mapOrNull(
          loaded: (state) {
            var filtered = List<Quest>.from(state.quests);

            // Primero ordenamos por ID
            filtered.sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));

            if (state.searchQuery.isNotEmpty) {
              final query = state.searchQuery.toLowerCase();
              filtered = filtered.where((q) {
                return q.name.toLowerCase().contains(query) ||
                    q.description.toLowerCase().contains(query) ||
                    q.location.toLowerCase().contains(query);
              }).toList();
            }

            return filtered;
          },
        ) ??
        [];
  }

  void toggleQuest(String id) async {
    state.mapOrNull(
      loaded: (state) async {
        final quest = state.quests.firstWhere((q) => q.id == id);

        // Solo permitir toggle si la misión está habilitada
        if (!isQuestEnabled(quest, state.quests)) return;

        try {
          await _repository.toggleQuestCompleted(_questType, id);

          final updatedQuests = state.quests.map((quest) {
            if (quest.id == id) {
              return quest.copyWith(isCompleted: !quest.isCompleted);
            }
            return quest;
          }).toList();

          _filterAndSortQuests(state.copyWith(quests: updatedQuests));
        } catch (e) {
          emit(QuestsState.error(e.toString()));
        }
      },
    );
  }

  void updateSearch(String query) {
    state.mapOrNull(
      loaded: (state) =>
          _filterAndSortQuests(state.copyWith(searchQuery: query)),
    );
  }

  void updateSort(QuestSort sort) {
    state.mapOrNull(
      loaded: (state) => _filterAndSortQuests(state.copyWith(sort: sort)),
    );
  }

  void _filterAndSortQuests(QuestsState state) {
    emit(state);
  }
}
