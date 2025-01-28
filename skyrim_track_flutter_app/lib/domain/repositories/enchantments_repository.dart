import '/domain/entities/enchantment.dart';

abstract class EnchantmentsRepository {
  Future<List<Enchantment>> getEnchantments();
  Future<void> toggleEnchantmentLearned(String id);
}
