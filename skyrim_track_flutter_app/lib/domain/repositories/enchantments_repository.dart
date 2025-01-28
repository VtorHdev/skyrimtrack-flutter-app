import '/domain/entities/enchantment.dart';

abstract class EnchantmentsRepository {
  Future<List<Enchantment>> getAll();
  Future<void> toggleMarked(String id);
}
