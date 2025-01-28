import 'package:freezed_annotation/freezed_annotation.dart';
import '/domain/entities/house.dart';
import '/domain/enums/house_sort.dart';

part 'houses_state.freezed.dart';

@freezed
class HousesState with _$HousesState {
  const factory HousesState.initial() = _Initial;
  const factory HousesState.loading() = _Loading;
  const factory HousesState.error(String message) = _Error;
  const factory HousesState.loaded({
    required List<House> houses,
    @Default('') String searchQuery,
    @Default(HouseSort.name) HouseSort sortBy,
  }) = _Loaded;
}
