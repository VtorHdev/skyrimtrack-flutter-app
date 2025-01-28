import 'package:freezed_annotation/freezed_annotation.dart';
import '/domain/entities/quest.dart';
import '/domain/enums/quest_sort.dart';

part 'quests_state.freezed.dart';

@freezed
class QuestsState with _$QuestsState {
  const factory QuestsState.initial() = _Initial;
  const factory QuestsState.loading() = _Loading;
  const factory QuestsState.error(String message) = _Error;
  const factory QuestsState.loaded({
    required List<Quest> quests,
    @Default('') String searchQuery,
    @Default(QuestSort.name) QuestSort sort,
  }) = _Loaded;
}
