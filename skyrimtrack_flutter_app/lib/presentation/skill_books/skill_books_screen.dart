import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/domain/enums/skill_book_sort.dart';
import 'cubit/skill_books_cubit.dart';
import 'cubit/skill_books_state.dart';
import 'widgets/skill_book_card.dart';

class SkillBooksScreen extends StatelessWidget {
  const SkillBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SkillBooksView();
  }
}

class _SkillBooksView extends StatelessWidget {
  const _SkillBooksView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libros de Habilidad'),
        actions: const [_SortButton()],
      ),
      body: Column(
        children: [
          const _SearchField(),
          const Expanded(child: _SkillBooksList()),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.primary.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: theme.colorScheme.onSurface.withOpacity(0.7),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: 'Buscar por nombre o habilidad...',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.5),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
              onChanged: context.read<SkillBooksCubit>().updateSearch,
            ),
          ),
        ],
      ),
    );
  }
}

class _SortButton extends StatelessWidget {
  const _SortButton();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SkillBookSort>(
      icon: const Icon(Icons.sort),
      onSelected: context.read<SkillBooksCubit>().updateSort,
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: SkillBookSort.name,
          child: Text('Ordenar por nombre'),
        ),
        PopupMenuItem(
          value: SkillBookSort.skill,
          child: Text('Ordenar por habilidad'),
        ),
        PopupMenuItem(
          value: SkillBookSort.status,
          child: Text('Ordenar por estado'),
        ),
      ],
    );
  }
}

class _SkillBooksList extends StatelessWidget {
  const _SkillBooksList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillBooksCubit, SkillBooksState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox(),
          loading: (_) => const Center(
            child: CircularProgressIndicator(color: Colors.amber),
          ),
          error: (state) => Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.amber),
            ),
          ),
          loaded: (_) {
            final books =
                context.read<SkillBooksCubit>().getFilteredAndSortedBooks();

            if (books.isEmpty) {
              return const Center(
                child: Text(
                  'No se encontraron libros',
                  style: TextStyle(color: Colors.amber),
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: books.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              ),
              itemBuilder: (context, index) => SkillBookCard(
                book: books[index],
              ),
            );
          },
        );
      },
    );
  }
}
