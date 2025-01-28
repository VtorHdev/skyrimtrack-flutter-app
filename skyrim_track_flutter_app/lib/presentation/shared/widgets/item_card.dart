import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String? subtitle;
  final bool isMarked;
  final bool isEnabled;
  final VoidCallback onTap;

  const ItemCard({
    super.key,
    required this.title,
    required this.description,
    this.subtitle,
    required this.isMarked,
    this.isEnabled = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: isMarked
          ? colorScheme.primaryContainer.withValues(alpha: 0.1)
          : Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        child: Opacity(
          opacity: isEnabled ? 1.0 : 0.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.titleSmall?.copyWith(
                          fontFamily: 'Cinzel',
                          color: isMarked
                              ? colorScheme.primary
                              : colorScheme.onSurface,
                          fontWeight:
                              isMarked ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: textTheme.bodySmall?.copyWith(
                          height: 1.2,
                          color: isMarked
                              ? colorScheme.onSurface.withValues(alpha: 0.8)
                              : colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          subtitle!,
                          style: textTheme.bodySmall?.copyWith(
                            height: 1.2,
                            color: isMarked
                                ? colorScheme.onSurface.withValues(alpha: 0.8)
                                : colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  isEnabled
                      ? (isMarked
                          ? Icons.check_circle
                          : Icons.check_circle_outline)
                      : Icons.lock_outline,
                  color: isMarked
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
