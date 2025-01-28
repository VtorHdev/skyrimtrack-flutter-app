import 'package:flutter/material.dart';
import '/domain/entities/shout.dart';

class ShoutCard extends StatelessWidget {
  final Shout shout;
  final Function(String) onWordTap;

  const ShoutCard({
    super.key,
    required this.shout,
    required this.onWordTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: shout.wordsLearned > 0
          ? colorScheme.primaryContainer.withValues(alpha: 0.1)
          : Colors.transparent,
      child: InkWell(
        onTap: () => onWordTap(shout.id),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shout.name,
                          style: textTheme.titleSmall?.copyWith(
                            fontFamily: 'Cinzel',
                            color: shout.wordsLearned > 0
                                ? colorScheme.primary
                                : colorScheme.onSurface,
                            fontWeight: shout.wordsLearned > 0
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          shout.description,
                          style: textTheme.bodySmall?.copyWith(
                            height: 1.2,
                            color: shout.wordsLearned > 0
                                ? colorScheme.onSurface.withValues(alpha: 0.8)
                                : colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${shout.wordsLearned}/3',
                        style: textTheme.titleMedium?.copyWith(
                          color: shout.wordsLearned > 0
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant
                                  .withValues(alpha: 0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'CD: ${shout.cooldown}',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.primary.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: shout.words
                    .asMap()
                    .entries
                    .map(
                      (entry) => Expanded(
                        child: _ShoutWord(
                          word: entry.value,
                          isLearned: entry.key < shout.wordsLearned,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoutWord extends StatelessWidget {
  final ShoutWord word;
  final bool isLearned;

  const _ShoutWord({
    required this.word,
    required this.isLearned,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color:
          isLearned ? theme.colorScheme.primary.withValues(alpha: 0.1) : null,
      child: Column(
        children: [
          Text(
            word.word,
            style: theme.textTheme.titleSmall?.copyWith(
              color: isLearned
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface.withValues(alpha: 0.7),
              fontFamily: 'Cinzel',
            ),
          ),
          const SizedBox(height: 2),
          Text(
            word.translation,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
