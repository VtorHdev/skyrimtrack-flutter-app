import 'package:freezed_annotation/freezed_annotation.dart';
import '/domain/entities/enchantment.dart';
import '/domain/enums/enchantment_sort.dart';

part 'enchantments_state.freezed.dart';

@freezed
class EnchantmentsState with _$EnchantmentsState {
  const factory EnchantmentsState.initial() = _Initial;
  const factory EnchantmentsState.loading() = _Loading;
  const factory EnchantmentsState.loaded({
    required List<Enchantment> enchantments,
    @Default('') String searchQuery,
    @Default(EnchantmentSort.name) EnchantmentSort sortBy,
  }) = _Loaded;
  const factory EnchantmentsState.error(String message) = _Error;
}
