import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/domain/entities/quest.dart';
import '../cubit/quests_cubit.dart';

class QuestItem extends StatelessWidget {
  final Quest quest;

  const QuestItem({
    super.key,
    required this.quest,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(
          quest.isCompleted ? Icons.check_circle : Icons.circle_outlined,
          color:
              quest.isCompleted ? Theme.of(context).colorScheme.primary : null,
        ),
        onPressed: () => context.read<QuestsCubit>().toggleQuest(quest.id),
      ),
      title: Text(
        quest.name,
        style: TextStyle(
          decoration: quest.isCompleted ? TextDecoration.lineThrough : null,
          fontFamily: 'Cinzel',
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(quest.description),
          if (quest.location.isNotEmpty)
            Text(
              'Ubicación: ${quest.location}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          if (quest.prerequisite.isNotEmpty)
            Text(
              'Requisito: ${quest.prerequisite}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
        ],
      ),
      isThreeLine: true,
    );
  }
}
