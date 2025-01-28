import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '/core/router/app_routes.dart';
import '/core/services/local_storage_service.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('uSkyrim'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: 5,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.2),
                ),
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return _FeatureCard(
                        title: 'Encantamientos',
                        icon: Icons.auto_fix_high,
                        onTap: () =>
                            context.pushNamed(AppRoutes.enchantments.name),
                      );
                    case 1:
                      return _FeatureCard(
                        title: 'Libros de Habilidad',
                        icon: Icons.book,
                        onTap: () =>
                            context.pushNamed(AppRoutes.skillBooks.name),
                      );
                    case 2:
                      return _FeatureCard(
                        title: 'Misiones',
                        icon: Icons.assignment,
                        onTap: () =>
                            context.pushNamed(AppRoutes.questCategories.name),
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
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 28, 16),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => _showResetConfirmation(context),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    child: Text(
                      'Resetear progreso',
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .error
                            .withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                  const Spacer(),
                  FutureBuilder<PackageInfo>(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const SizedBox.shrink();
                      return Text(
                        'v${snapshot.data!.version}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withValues(alpha: 0.5),
                            ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showResetConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Resetear progreso'),
        content: const Text(
          '¿Estás seguro de que quieres eliminar todo el progreso? Esta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              GetIt.I<LocalStorageService>().clearAll();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Progreso eliminado correctamente'),
                ),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Resetear'),
          ),
        ],
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
