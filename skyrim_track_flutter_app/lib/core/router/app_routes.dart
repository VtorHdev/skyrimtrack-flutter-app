class RouteData {
  final String name;
  final String path;

  const RouteData({
    required this.name,
    required this.path,
  });
}

class AppRoutes {
  static const home = RouteData(
    name: 'home',
    path: '/home',
  );

  static const enchantments = RouteData(
    name: 'enchantments',
    path: '/enchantments',
  );

  static const skillBooks = RouteData(
    name: 'skillBooks',
    path: '/skill-books',
  );

  static const questCategories = RouteData(
    name: 'questCategories',
    path: '/quests',
  );

  // Agrupamos las rutas de misiones
  static final quests = _QuestRoutes();
}

class _QuestRoutes {
  final main = const RouteData(
    name: 'mainQuest',
    path: '/quests/main',
  );

  final winterhold = const RouteData(
    name: 'winterholdQuests',
    path: '/quests/winterhold',
  );

  final darkBrotherhood = const RouteData(
    name: 'darkBrotherhoodQuests',
    path: '/quests/dark-brotherhood',
  );

  final companions = const RouteData(
    name: 'companionsQuests',
    path: '/quests/companions',
  );

  final thievesGuild = const RouteData(
    name: 'thievesGuildQuests',
    path: '/quests/thieves-guild',
  );

  final civilWar = const RouteData(
    name: 'civilWarQuests',
    path: '/quests/civil-war',
  );

  final daedric = const RouteData(
    name: 'daedricQuests',
    path: '/quests/daedric',
  );
}
