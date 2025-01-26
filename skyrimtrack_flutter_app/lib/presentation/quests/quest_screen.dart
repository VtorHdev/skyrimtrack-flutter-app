import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyrim_completionist_app/presentation/quests/cubit/quests_cubit.dart';
import 'package:skyrim_completionist_app/presentation/quests/cubit/quests_state.dart';
import '/domain/enums/quest_type.dart';
import 'widgets/quest_search_field.dart';
import 'widgets/quest_list.dart';

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
        actions: const [_ShowCompletedButton()],
      ),
      body: const Column(
        children: [
          QuestSearchField(),
          Expanded(child: QuestList()),
        ],
      ),
    );
  }
}

class _ShowCompletedButton extends StatelessWidget {
  const _ShowCompletedButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestsCubit, QuestsState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) => IconButton(
            icon: Icon(
              state.showCompleted
                  ? Icons.check_circle
                  : Icons.check_circle_outline,
            ),
            onPressed: () => context.read<QuestsCubit>().toggleShowCompleted(),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
