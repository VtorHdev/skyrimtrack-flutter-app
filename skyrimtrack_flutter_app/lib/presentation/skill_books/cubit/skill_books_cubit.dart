import 'package:flutter_bloc/flutter_bloc.dart';
import '/domain/entities/skill_book.dart';
import '/domain/enums/skill_book_sort.dart';
import '/domain/repositories/skill_books_repository.dart';
import 'skill_books_state.dart';

class SkillBooksCubit extends Cubit<SkillBooksState> {
  final SkillBooksRepository _repository;

  SkillBooksCubit(this._repository) : super(const SkillBooksState.initial()) {
    _loadSkillBooks();
  }

  void _loadSkillBooks() {
    emit(const SkillBooksState.loading());
    try {
      final books = _repository.getSkillBooks();
      emit(SkillBooksState.loaded(books: books));
    } catch (e) {
      emit(SkillBooksState.error(e.toString()));
    }
  }

  void updateSearch(String query) {
    state.mapOrNull(
      loaded: (state) => emit(state.copyWith(searchQuery: query)),
    );
  }

  void updateSort(SkillBookSort sort) {
    state.mapOrNull(
      loaded: (state) => emit(state.copyWith(sortBy: sort)),
    );
  }

  void toggleBook(String id) {
    state.mapOrNull(
      loaded: (state) {
        final updatedBooks = state.books.map((book) {
          if (book.id == id) {
            return SkillBook(
              id: book.id,
              name: book.name,
              skill: book.skill,
              location: book.location,
              isRead: !book.isRead,
            );
          }
          return book;
        }).toList();

        emit(state.copyWith(books: updatedBooks));
      },
    );
  }

  List<SkillBook> getFilteredAndSortedBooks() {
    return state.maybeMap(
      loaded: (state) {
        List<SkillBook> result = List.from(state.books);

        if (state.searchQuery.isNotEmpty) {
          final query = state.searchQuery.toLowerCase();
          result = result.where((book) {
            return book.name.toLowerCase().contains(query) ||
                book.skill.toLowerCase().contains(query);
          }).toList();
        }

        result.sort((a, b) {
          switch (state.sortBy) {
            case SkillBookSort.name:
              return a.name.compareTo(b.name);
            case SkillBookSort.skill:
              return a.skill.compareTo(b.skill);
            case SkillBookSort.status:
              if (a.isRead == b.isRead) return a.name.compareTo(b.name);
              return b.isRead ? 1 : -1;
          }
        });

        return result;
      },
      orElse: () => [],
    );
  }
}

extension SkillBookSorting on List<SkillBook> {
  List<SkillBook> sorted(SkillBookSort sortBy) {
    final sorted = List<SkillBook>.from(this);
    sorted.sort((a, b) {
      switch (sortBy) {
        case SkillBookSort.name:
          return a.name.compareTo(b.name);
        case SkillBookSort.skill:
          return a.skill.compareTo(b.skill);
        case SkillBookSort.status:
          if (a.isRead == b.isRead) return a.name.compareTo(b.name);
          return b.isRead ? 1 : -1;
      }
    });
    return sorted;
  }
}
