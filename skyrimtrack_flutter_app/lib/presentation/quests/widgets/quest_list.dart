import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/quests_cubit.dart';
import '../cubit/quests_state.dart';
import 'quest_item.dart';

class QuestList extends StatelessWidget {
  const QuestList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestsCubit, QuestsState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox.shrink(),
          loading: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (_) {
            final quests = context.read<QuestsCubit>().getFilteredQuests();
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: quests.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) => QuestItem(
                quest: quests[index],
              ),
            );
          },
          error: (state) => Center(
            child: Text(
              'Error: ${state.message}',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
