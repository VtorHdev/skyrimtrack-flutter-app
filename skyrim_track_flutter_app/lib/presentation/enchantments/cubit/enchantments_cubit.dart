import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uskyrim/domain/enums/enchantment_sort.dart';
import '/domain/entities/enchantment.dart';
import '/domain/repositories/enchantments_repository.dart';
import 'enchantments_state.dart';

class EnchantmentsCubit extends Cubit<EnchantmentsState> {
  final EnchantmentsRepository _repository;

  EnchantmentsCubit(this._repository)
      : super(const EnchantmentsState.initial()) {
    loadItems();
  }

  Future<void> loadItems() async {
    emit(const EnchantmentsState.loading());
    try {
      final items = await _repository.getAll();
      emit(EnchantmentsState.loaded(enchantments: items));
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

  void toggleItem(String id) async {
    state.mapOrNull(
      loaded: (state) async {
        try {
          await _repository.toggleMarked(id);
          final updatedItems = state.enchantments.map((item) {
            if (item.id == id) {
              return item.copyWith(isLearned: !item.isLearned);
            }
            return item;
          }).toList();
          emit(state.copyWith(enchantments: updatedItems));
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
