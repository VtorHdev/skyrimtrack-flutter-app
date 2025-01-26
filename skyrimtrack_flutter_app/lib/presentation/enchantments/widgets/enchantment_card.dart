import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyrim_completionist_app/domain/entities/enchantment.dart';
import 'package:skyrim_completionist_app/presentation/enchantments/cubit/enchantments_cubit.dart';

class EnchantmentCard extends StatelessWidget {
  const EnchantmentCard({
    super.key,
    required this.enchantment,
  });

  final Enchantment enchantment;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () =>
            context.read<EnchantmentsCubit>().toggleEnchantment(enchantment.id),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      enchantment.name,
                      style: textTheme.titleSmall?.copyWith(
                        fontFamily: 'Cinzel',
                        color: enchantment.isLearned
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      enchantment.effect,
                      style: textTheme.bodySmall?.copyWith(
                        height: 1.2,
                        color: enchantment.isLearned
                            ? colorScheme.onSurface.withOpacity(0.7)
                            : colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                enchantment.isLearned
                    ? Icons.check_circle
                    : Icons.check_circle_outline,
                color: enchantment.isLearned
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
