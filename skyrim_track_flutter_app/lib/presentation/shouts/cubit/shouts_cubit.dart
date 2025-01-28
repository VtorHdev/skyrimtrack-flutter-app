import 'package:flutter_bloc/flutter_bloc.dart';
import '/domain/entities/shout.dart';
import '/domain/enums/shout_sort.dart';
import '/domain/repositories/shouts_repository.dart';
import 'shouts_state.dart';

class ShoutsCubit extends Cubit<ShoutsState> {
  final ShoutsRepository _repository;

  ShoutsCubit(this._repository) : super(const ShoutsState.initial()) {
    loadItems();
  }

  Future<void> loadItems() async {
    emit(const ShoutsState.loading());
    try {
      final items = await _repository.getAll();
      emit(ShoutsState.loaded(shouts: items));
    } catch (e) {
      emit(ShoutsState.error(e.toString()));
    }
  }

  void toggleWord(String id) async {
    state.mapOrNull(
      loaded: (state) async {
        try {
          await _repository.toggleWord(id);
          final updatedItems = state.shouts.map((item) {
            if (item.id == id) {
              final newWordsLearned = item.wordsLearned >= 3
                  ? 0
                  : (item.wordsLearned + 1).clamp(0, 3);
              return item.copyWith(wordsLearned: newWordsLearned);
            }
            return item;
          }).toList();
          emit(state.copyWith(shouts: updatedItems));
        } catch (e) {
          emit(ShoutsState.error(e.toString()));
        }
      },
    );
  }

  void updateSearch(String query) {
    state.mapOrNull(
      loaded: (state) => emit(state.copyWith(searchQuery: query)),
    );
  }

  void updateSort(ShoutSort sort) {
    state.mapOrNull(
      loaded: (state) => emit(state.copyWith(sortBy: sort)),
    );
  }

  List<Shout> getFilteredAndSortedShouts() {
    return state.maybeMap(
      loaded: (state) {
        List<Shout> result = List.from(state.shouts);

        if (state.searchQuery.isNotEmpty) {
          final query = state.searchQuery.toLowerCase();
          result = result.where((shout) {
            return shout.name.toLowerCase().contains(query) ||
                shout.description.toLowerCase().contains(query) ||
                shout.words.any((word) =>
                    word.word.toLowerCase().contains(query) ||
                    word.translation.toLowerCase().contains(query));
          }).toList();
        }

        result.sort((a, b) {
          switch (state.sortBy) {
            case ShoutSort.name:
              return a.name.compareTo(b.name);
            case ShoutSort.progress:
              if (a.wordsLearned == b.wordsLearned) {
                return a.name.compareTo(b.name);
              }
              return b.wordsLearned.compareTo(a.wordsLearned);
          }
        });

        return result;
      },
      orElse: () => [],
    );
  }
}
