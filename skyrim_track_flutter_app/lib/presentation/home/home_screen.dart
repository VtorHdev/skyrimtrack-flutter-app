import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/core/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skyrim Tracker'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: 5,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return _FeatureCard(
                title: 'Encantamientos',
                icon: Icons.auto_fix_high,
                onTap: () => context.pushNamed(AppRoutes.enchantments.name),
              );
            case 1:
              return _FeatureCard(
                title: 'Libros de Habilidad',
                icon: Icons.book,
                onTap: () => context.pushNamed(AppRoutes.skillBooks.name),
              );
            case 2:
              return _FeatureCard(
                title: 'Misiones',
                icon: Icons.assignment,
                onTap: () => context.pushNamed(AppRoutes.questCategories.name),
              );
            case 3:
              return _FeatureCard(
                title: 'Casas',
                icon: Icons.home,
                onTap: () => context.pushNamed(AppRoutes.houses.name),
              );
            case 4:
              return _FeatureCard(
                title: 'Gritos',
                icon: Icons.record_voice_over,
                onTap: () => context.pushNamed(AppRoutes.shouts.name),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
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
