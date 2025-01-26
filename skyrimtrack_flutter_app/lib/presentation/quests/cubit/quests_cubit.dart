import 'package:flutter_bloc/flutter_bloc.dart';
import '/domain/entities/quest.dart';
import '/domain/enums/quest_type.dart';
import '/domain/repositories/quests_repository.dart';
import 'quests_state.dart';

class QuestsCubit extends Cubit<QuestsState> {
  final QuestsRepository _repository;
  final QuestType _questType;

  QuestsCubit(this._repository, this._questType)
      : super(const QuestsState.initial()) {
    _loadQuests();
  }

  void _loadQuests() {
    emit(const QuestsState.loading());
    try {
      final quests = switch (_questType) {
        QuestType.main => _repository.getMainQuests(),
        QuestType.winterhold => _repository.getWinterholdQuests(),
        QuestType.darkBrotherhood => _repository.getDarkBrotherhoodQuests(),
        QuestType.companions => _repository.getCompanionsQuests(),
        QuestType.thievesGuild => _repository.getThievesGuildQuests(),
        QuestType.civilWar => _repository.getCivilWarQuests(),
        QuestType.daedric => _repository.getDaedricQuests(),
      };
      emit(QuestsState.loaded(quests: quests));
    } catch (e) {
      emit(QuestsState.error(e.toString()));
    }
  }

  void toggleQuest(String id) {
    state.mapOrNull(
      loaded: (state) {
        final updatedQuests = state.quests.map((quest) {
          if (quest.id == id) {
            return quest.copyWith(isCompleted: !quest.isCompleted);
          }
          return quest;
        }).toList();
        emit(state.copyWith(quests: updatedQuests));
      },
    );
  }

  void updateSearch(String query) {
    state.mapOrNull(
      loaded: (state) => emit(state.copyWith(searchQuery: query)),
    );
  }

  void toggleShowCompleted() {
    state.mapOrNull(
      loaded: (state) =>
          emit(state.copyWith(showCompleted: !state.showCompleted)),
    );
  }

  List<Quest> getFilteredQuests() {
    return state.maybeMap(
      loaded: (state) {
        var filteredQuests = state.quests;

        if (!state.showCompleted) {
          filteredQuests = filteredQuests.where((q) => !q.isCompleted).toList();
        }

        if (state.searchQuery.isNotEmpty) {
          final query = state.searchQuery.toLowerCase();
          filteredQuests = filteredQuests.where((q) {
            return q.name.toLowerCase().contains(query) ||
                q.description.toLowerCase().contains(query) ||
                q.location.toLowerCase().contains(query);
          }).toList();
        }

        return filteredQuests;
      },
      orElse: () => [],
    );
  }
}
