import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyrim_completionist_app/domain/entities/skill_book.dart';
import 'package:skyrim_completionist_app/presentation/skill_books/cubit/skill_books_cubit.dart';

class SkillBookCard extends StatelessWidget {
  const SkillBookCard({
    super.key,
    required this.book,
  });

  final SkillBook book;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.read<SkillBooksCubit>().toggleBook(book.id),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.name,
                      style: textTheme.titleSmall?.copyWith(
                        fontFamily: 'Cinzel',
                        color: book.isRead
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _BookDetails(book: book),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _ReadStatusIcon(isRead: book.isRead),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookDetails extends StatelessWidget {
  const _BookDetails({required this.book});

  final SkillBook book;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Habilidad: ${book.skill}',
          style: textTheme.bodySmall?.copyWith(
            height: 1.2,
            color: book.isRead
                ? colorScheme.onSurface.withOpacity(0.7)
                : colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Ubicación: ${book.location}',
          style: textTheme.bodySmall?.copyWith(
            height: 1.2,
            color: book.isRead
                ? colorScheme.onSurface.withOpacity(0.7)
                : colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}

class _ReadStatusIcon extends StatelessWidget {
  const _ReadStatusIcon({required this.isRead});

  final bool isRead;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: Icon(
        isRead ? Icons.check_circle : Icons.check_circle_outline,
        key: ValueKey(isRead),
        color: isRead ? colorScheme.primary : colorScheme.onSurfaceVariant,
      ),
    );
  }
}
