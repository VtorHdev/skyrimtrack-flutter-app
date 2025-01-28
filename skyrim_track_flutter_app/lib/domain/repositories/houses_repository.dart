import '/domain/entities/house.dart';

abstract class HousesRepository {
  Future<List<House>> getAll();
  Future<void> toggleMarked(String id);
}
