import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/domain/enums/house_sort.dart';
import '/presentation/shared/widgets/item_list.dart';
import '/presentation/shared/widgets/item_card.dart';
import 'cubit/houses_cubit.dart';
import 'cubit/houses_state.dart';

class HousesScreen extends StatelessWidget {
  const HousesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Casas'),
        actions: const [_SortButton()],
      ),
      body: Column(
        children: [
          const _SearchField(),
          Expanded(
            child: BlocBuilder<HousesCubit, HousesState>(
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
                  final houses =
                      context.read<HousesCubit>().getFilteredAndSortedHouses();
                  return ItemList(
                    itemCount: houses.length,
                    itemBuilder: (context, index) => ItemCard(
                      title: houses[index].name,
                      subtitle: houses[index].location,
                      description: '''${houses[index].description}
${houses[index].isDLC ? '\nDLC: ${houses[index].dlcName ?? ""}' : ''}
Requisitos: ${houses[index].requirements}''',
                      isMarked: houses[index].isAcquired,
                      onTap: () => context
                          .read<HousesCubit>()
                          .toggleItem(houses[index].id),
                    ),
                    emptyMessage: 'No se encontraron casas',
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
            color: theme.colorScheme.primary.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: 'Buscar casas...',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
              onChanged: context.read<HousesCubit>().updateSearch,
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
    return PopupMenuButton<HouseSort>(
      icon: const Icon(Icons.sort),
      onSelected: context.read<HousesCubit>().updateSort,
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: HouseSort.name,
          child: Text('Ordenar por nombre'),
        ),
        PopupMenuItem(
          value: HouseSort.location,
          child: Text('Ordenar por ubicación'),
        ),
        PopupMenuItem(
          value: HouseSort.status,
          child: Text('Ordenar por estado'),
        ),
        PopupMenuItem(
          value: HouseSort.dlc,
          child: Text('Ordenar por DLC'),
        ),
      ],
    );
  }
}
