import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/core/router/app_routes.dart';

class QuestCategoriesScreen extends StatelessWidget {
  const QuestCategoriesScreen({super.key});

  static final _categories = [
    (
      route: AppRoutes.quests.main,
      title: 'Historia Principal',
      icon: Icons.star,
    ),
    (
      route: AppRoutes.quests.winterhold,
      title: 'Colegio de Hibernalia',
      icon: Icons.school,
    ),
    (
      route: AppRoutes.quests.darkBrotherhood,
      title: 'Hermandad Oscura',
      icon: Icons.nights_stay,
    ),
    (
      route: AppRoutes.quests.companions,
      title: 'Los Compañeros',
      icon: Icons.group,
    ),
    (
      route: AppRoutes.quests.thievesGuild,
      title: 'Gremio de Ladrones',
      icon: Icons.money,
    ),
    (
      route: AppRoutes.quests.civilWar,
      title: 'Guerra Civil',
      icon: Icons.security,
    ),
    (
      route: AppRoutes.quests.daedric,
      title: 'Misiones Daédricas',
      icon: Icons.whatshot,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Misiones'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: _categories.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
        itemBuilder: (context, index) {
          final category = _categories[index];
          return _QuestCategoryCard(
            title: category.title,
            icon: category.icon,
            onTap: () => context.pushNamed(category.route.name),
          );
        },
      ),
    );
  }
}

class _QuestCategoryCard extends StatelessWidget {
  const _QuestCategoryCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(icon, size: 28),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFamily: 'Cinzel',
                      ),
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
