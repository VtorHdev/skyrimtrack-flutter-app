class SkillBook {
  final String id;
  final String name;
  final String skill;
  final String location;
  final String description;
  final String questRelated;
  final bool isRead;
  final bool isCollected;

  const SkillBook({
    required this.id,
    required this.name,
    required this.skill,
    required this.location,
    this.description = '',
    this.questRelated = '',
    this.isRead = false,
    this.isCollected = false,
  });
}
