import 'package:freezed_annotation/freezed_annotation.dart';
import '/domain/entities/skill_book.dart';
import '/domain/enums/skill_book_sort.dart';

part 'skill_books_state.freezed.dart';

@freezed
class SkillBooksState with _$SkillBooksState {
  const factory SkillBooksState.initial() = _Initial;
  const factory SkillBooksState.loading() = _Loading;
  const factory SkillBooksState.loaded({
    required List<SkillBook> books,
    @Default('') String searchQuery,
    @Default(SkillBookSort.name) SkillBookSort sortBy,
  }) = _Loaded;
  const factory SkillBooksState.error(String message) = _Error;
}
