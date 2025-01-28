import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyrim_completionist_app/domain/enums/enchantment_sort.dart';
import '/domain/entities/enchantment.dart';
import '/domain/repositories/enchantments_repository.dart';
import 'enchantments_state.dart';

class EnchantmentsCubit extends Cubit<EnchantmentsState> {
  final EnchantmentsRepository _repository;

  EnchantmentsCubit(this._repository)
      : super(const EnchantmentsState.initial()) {
    _loadEnchantments();
  }

  void _loadEnchantments() async {
    emit(const EnchantmentsState.loading());
    try {
      final enchantments = await _repository.getEnchantments();
      emit(EnchantmentsState.loaded(enchantments: enchantments));
    } catch (e) {
      emit(EnchantmentsState.error(e.toString()));
    }
  }

  void updateSearch(String query) {
    state.mapOrNull(
      loaded: (state) => emit(state.copyWith(searchQuery: query)),
    );
  }

  void updateSort(EnchantmentSort sort) {
    state.mapOrNull(
      loaded: (state) => emit(state.copyWith(sortBy: sort)),
    );
  }

  void toggleEnchantment(String id) async {
    state.mapOrNull(
      loaded: (state) async {
        try {
          await _repository.toggleEnchantmentLearned(id);

          final updatedEnchantments = state.enchantments.map((enchantment) {
            if (enchantment.id == id) {
              return Enchantment(
                id: enchantment.id,
                name: enchantment.name,
                effect: enchantment.effect,
                type: enchantment.type,
                source: enchantment.source,
                magnitude: enchantment.magnitude,
                isLearned: !enchantment.isLearned,
              );
            }
            return enchantment;
          }).toList();

          emit(state.copyWith(enchantments: updatedEnchantments));
        } catch (e) {
          emit(EnchantmentsState.error(e.toString()));
        }
      },
    );
  }

  List<Enchantment> getFilteredAndSortedEnchantments() {
    return state.maybeMap(
      loaded: (state) {
        List<Enchantment> result = List.from(state.enchantments);

        if (state.searchQuery.isNotEmpty) {
          result = result.where((e) {
            final searchLower = state.searchQuery.toLowerCase();
            return e.name.toLowerCase().contains(searchLower) ||
                e.effect.toLowerCase().contains(searchLower) ||
                e.source.toLowerCase().contains(searchLower);
          }).toList();
        }

        result.sort((a, b) {
          switch (state.sortBy) {
            case EnchantmentSort.name:
              return a.name.compareTo(b.name);
            case EnchantmentSort.type:
              final typeCompare = a.type.compareTo(b.type);
              return typeCompare != 0 ? typeCompare : a.name.compareTo(b.name);
            case EnchantmentSort.status:
              if (a.isLearned == b.isLearned) return a.name.compareTo(b.name);
              return b.isLearned ? 1 : -1;
          }
        });

        return result;
      },
      orElse: () => [],
    );
  }
}
