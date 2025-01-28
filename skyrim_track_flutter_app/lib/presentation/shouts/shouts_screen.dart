import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/domain/enums/shout_sort.dart';
import '/presentation/shared/widgets/shout_card.dart';
import 'cubit/shouts_cubit.dart';
import 'cubit/shouts_state.dart';

class ShoutsScreen extends StatelessWidget {
  const ShoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gritos'),
        actions: const [_SortButton()],
      ),
      body: Column(
        children: [
          const _SearchField(),
          Expanded(
            child: BlocBuilder<ShoutsCubit, ShoutsState>(
              builder: (context, state) => state.map(
                initial: (_) => const SizedBox.shrink(),
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
                  final shouts =
                      context.read<ShoutsCubit>().getFilteredAndSortedShouts();
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: shouts.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.2),
                    ),
                    itemBuilder: (context, index) => ShoutCard(
                      shout: shouts[index],
                      onWordTap: context.read<ShoutsCubit>().toggleWord,
                    ),
                  );
                },
              ),
            ),
          ),
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
                hintText: 'Buscar gritos...',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.5),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
              onChanged: context.read<ShoutsCubit>().updateSearch,
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
    return PopupMenuButton<ShoutSort>(
      icon: const Icon(Icons.sort),
      onSelected: context.read<ShoutsCubit>().updateSort,
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: ShoutSort.name,
          child: Text('Ordenar por nombre'),
        ),
        PopupMenuItem(
          value: ShoutSort.progress,
          child: Text('Ordenar por progreso'),
        ),
      ],
    );
  }
}
