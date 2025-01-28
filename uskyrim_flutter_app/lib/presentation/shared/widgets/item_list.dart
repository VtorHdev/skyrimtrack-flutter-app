import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final String emptyMessage;

  const ItemList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.emptyMessage = 'No se encontraron elementos',
  });

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return Center(
        child: Text(
          emptyMessage,
          style: const TextStyle(color: Colors.amber),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: itemCount,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
      ),
      itemBuilder: itemBuilder,
    );
  }
}
