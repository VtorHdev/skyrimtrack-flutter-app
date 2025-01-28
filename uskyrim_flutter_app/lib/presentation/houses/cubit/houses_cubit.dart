import 'package:flutter_bloc/flutter_bloc.dart';
import '/domain/entities/house.dart';
import '/domain/enums/house_sort.dart';
import '/domain/repositories/houses_repository.dart';
import 'houses_state.dart';

class HousesCubit extends Cubit<HousesState> {
  final HousesRepository _repository;

  HousesCubit(this._repository) : super(const HousesState.initial()) {
    loadItems();
  }

  Future<void> loadItems() async {
    emit(const HousesState.loading());
    try {
      final items = await _repository.getAll();
      emit(HousesState.loaded(houses: items));
    } catch (e) {
      emit(HousesState.error(e.toString()));
    }
  }

  void toggleItem(String id) async {
    state.mapOrNull(
      loaded: (state) async {
        try {
          await _repository.toggleMarked(id);
          final updatedItems = state.houses.map((item) {
            if (item.id == id) {
              return item.copyWith(isAcquired: !item.isAcquired);
            }
            return item;
          }).toList();
          emit(state.copyWith(houses: updatedItems));
        } catch (e) {
          emit(HousesState.error(e.toString()));
        }
      },
    );
  }

  void updateSearch(String query) {
    state.mapOrNull(
      loaded: (state) => emit(state.copyWith(searchQuery: query)),
    );
  }

  void updateSort(HouseSort sort) {
    state.mapOrNull(
      loaded: (state) => emit(state.copyWith(sortBy: sort)),
    );
  }

  List<House> getFilteredAndSortedHouses() {
    return state.maybeMap(
      loaded: (state) {
        List<House> result = List.from(state.houses);

        if (state.searchQuery.isNotEmpty) {
          final query = state.searchQuery.toLowerCase();
          result = result.where((house) {
            return house.name.toLowerCase().contains(query) ||
                house.location.toLowerCase().contains(query) ||
                house.description.toLowerCase().contains(query);
          }).toList();
        }

        result.sort((a, b) {
          switch (state.sortBy) {
            case HouseSort.name:
              return a.name.compareTo(b.name);
            case HouseSort.location:
              return a.location.compareTo(b.location);
            case HouseSort.status:
              if (a.isAcquired == b.isAcquired) return a.name.compareTo(b.name);
              return b.isAcquired ? 1 : -1;
            case HouseSort.dlc:
              if (a.isDLC == b.isDLC) return a.name.compareTo(b.name);
              return a.isDLC ? 1 : -1;
          }
        });

        return result;
      },
      orElse: () => [],
    );
  }
}
