enum TrackedItem {
  skillBooks('skill_books_read'),
  enchantments('enchantments_learned'),
  mainQuests('main_quests_completed'),
  winterholdQuests('winterhold_quests_completed'),
  thievesQuests('thieves_quests_completed'),
  darkBrotherhoodQuests('dark_brotherhood_quests_completed'),
  daedricQuests('daedric_quests_completed'),
  companionsQuests('companions_quests_completed'),
  civilWarQuests('civil_war_quests_completed'),
  houses('houses_acquired');

  final String key;
  const TrackedItem(this.key);
}
