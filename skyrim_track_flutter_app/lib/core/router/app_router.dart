import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skyrim_completionist_app/domain/enums/quest_type.dart';
import 'package:skyrim_completionist_app/domain/repositories/enchantments_repository.dart';
import 'package:skyrim_completionist_app/domain/repositories/quests_repository.dart';
import 'package:skyrim_completionist_app/domain/repositories/skill_books_repository.dart';
import 'package:skyrim_completionist_app/presentation/enchantments/cubit/enchantments_cubit.dart';
import 'package:skyrim_completionist_app/presentation/skill_books/cubit/skill_books_cubit.dart';
import '/presentation/enchantments/enchantments_screen.dart';
import '/presentation/home/home_screen.dart';
import '/presentation/skill_books/skill_books_screen.dart';
import '/presentation/quests/quest_screen.dart';
import '/presentation/quests/cubit/quests_cubit.dart';
import 'app_routes.dart';
import '/presentation/quests/quest_categories_screen.dart';
import 'package:get_it/get_it.dart';
import '/presentation/houses/houses_screen.dart';
import '/presentation/houses/cubit/houses_cubit.dart';
import '/domain/repositories/houses_repository.dart';

final navigationKey = GlobalKey<NavigatorState>();

final _questConfigs = {
  AppRoutes.quests.main: (
    title: 'Historia Principal',
    type: QuestType.main,
  ),
  AppRoutes.quests.winterhold: (
    title: 'Colegio de Hibernalia',
    type: QuestType.winterhold,
  ),
  AppRoutes.quests.darkBrotherhood: (
    title: 'Hermandad Oscura',
    type: QuestType.darkBrotherhood,
  ),
  AppRoutes.quests.companions: (
    title: 'Los Compañeros',
    type: QuestType.companions,
  ),
  AppRoutes.quests.thievesGuild: (
    title: 'Gremio de Ladrones',
    type: QuestType.thievesGuild,
  ),
  AppRoutes.quests.civilWar: (
    title: 'Guerra Civil',
    type: QuestType.civilWar,
  ),
  AppRoutes.quests.daedric: (
    title: 'Misiones Daédricas',
    type: QuestType.daedric,
  ),
};

final appRouter = GoRouter(
  navigatorKey: navigationKey,
  initialLocation: AppRoutes.home.path,
  routes: [
    _createHomeRoute(),
    _createEnchantmentsRoute(),
    _createSkillBooksRoute(),
    ..._createQuestRoutes(),
    _createQuestCategoriesRoute(),
    GoRoute(
      path: AppRoutes.houses.path,
      name: AppRoutes.houses.name,
      builder: (_, __) => BlocProvider(
        create: (_) => HousesCubit(GetIt.I<HousesRepository>()),
        child: const HousesScreen(),
      ),
    ),
  ],
  errorBuilder: (context, state) => const HomeScreen(),
);

GoRoute _createHomeRoute() => GoRoute(
      path: AppRoutes.home.path,
      name: AppRoutes.home.name,
      builder: (_, __) => const HomeScreen(),
    );

GoRoute _createEnchantmentsRoute() => GoRoute(
      path: AppRoutes.enchantments.path,
      name: AppRoutes.enchantments.name,
      builder: (_, __) => BlocProvider(
        create: (_) => EnchantmentsCubit(GetIt.I<EnchantmentsRepository>()),
        child: const EnchantmentsScreen(),
      ),
    );

GoRoute _createSkillBooksRoute() => GoRoute(
      path: AppRoutes.skillBooks.path,
      name: AppRoutes.skillBooks.name,
      builder: (_, __) => BlocProvider(
        create: (_) => SkillBooksCubit(GetIt.I<SkillBooksRepository>()),
        child: const SkillBooksScreen(),
      ),
    );

List<GoRoute> _createQuestRoutes() => _questConfigs.entries
    .map(
      (entry) => GoRoute(
        path: entry.key.path,
        name: entry.key.name,
        builder: (context, state) => BlocProvider(
          create: (_) => QuestsCubit(
            GetIt.I<QuestsRepository>(),
            entry.value.type,
          ),
          child: QuestScreen(
            title: entry.value.title,
            questType: entry.value.type,
          ),
        ),
      ),
    )
    .toList();

GoRoute _createQuestCategoriesRoute() => GoRoute(
      path: AppRoutes.questCategories.path,
      name: AppRoutes.questCategories.name,
      builder: (_, __) => const QuestCategoriesScreen(),
    );
