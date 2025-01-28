import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/domain/enums/quest_type.dart';
import '/domain/enums/quest_sort.dart';
import '/presentation/shared/widgets/item_list.dart';
import '/presentation/shared/widgets/item_card.dart';
import 'cubit/quests_cubit.dart';
import 'cubit/quests_state.dart';

class QuestScreen extends StatelessWidget {
  final String title;
  final QuestType questType;

  const QuestScreen({
    super.key,
    required this.title,
    required this.questType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [_SortButton()],
      ),
      body: Column(
        children: [
          const _SearchField(),
          Expanded(
            child: BlocBuilder<QuestsCubit, QuestsState>(
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
                  final quests =
                      context.read<QuestsCubit>().getFilteredAndSortedQuests();
                  final cubit = context.read<QuestsCubit>();

                  return ItemList(
                    itemCount: quests.length,
                    itemBuilder: (context, index) {
                      final quest = quests[index];
                      final isEnabled = cubit.isQuestEnabled(quest, quests);

                      return ItemCard(
                        title: quest.name,
                        description: quest.description,
                        subtitle: quest.location.isNotEmpty
                            ? 'Ubicación: ${quest.location}'
                            : null,
                        isMarked: quest.isCompleted,
                        isEnabled: isEnabled,
                        onTap: () => cubit.toggleItem(quest.id),
                      );
                    },
                    emptyMessage: 'No se encontraron misiones',
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
                hintText: 'Buscar misión...',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.5),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
              onChanged: context.read<QuestsCubit>().updateSearch,
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
    return PopupMenuButton<QuestSort>(
      icon: const Icon(Icons.sort),
      onSelected: context.read<QuestsCubit>().updateSort,
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: QuestSort.name,
          child: Text('Ordenar por nombre'),
        ),
        PopupMenuItem(
          value: QuestSort.status,
          child: Text('Ordenar por estado'),
        ),
      ],
    );
  }
}
