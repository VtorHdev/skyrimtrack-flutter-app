import 'package:freezed_annotation/freezed_annotation.dart';
import '/domain/entities/shout.dart';
import '/domain/enums/shout_sort.dart';

part 'shouts_state.freezed.dart';

@freezed
class ShoutsState with _$ShoutsState {
  const factory ShoutsState.initial() = _Initial;
  const factory ShoutsState.loading() = _Loading;
  const factory ShoutsState.error(String message) = _Error;
  const factory ShoutsState.loaded({
    required List<Shout> shouts,
    @Default('') String searchQuery,
    @Default(ShoutSort.name) ShoutSort sortBy,
  }) = _Loaded;
}
