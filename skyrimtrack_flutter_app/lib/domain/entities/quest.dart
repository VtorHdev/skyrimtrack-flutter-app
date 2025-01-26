class Quest {
  final String id;
  final String name;
  final String description;
  final String location;
  final String prerequisite;
  final bool isCompleted;

  const Quest({
    required this.id,
    required this.name,
    required this.description,
    this.location = '',
    this.prerequisite = '',
    this.isCompleted = false,
  });

  Quest copyWith({
    String? id,
    String? name,
    String? description,
    String? location,
    String? prerequisite,
    bool? isCompleted,
  }) {
    return Quest(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      location: location ?? this.location,
      prerequisite: prerequisite ?? this.prerequisite,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
