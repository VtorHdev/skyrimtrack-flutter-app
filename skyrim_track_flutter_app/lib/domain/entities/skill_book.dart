class SkillBook {
  final String id;
  final String name;
  final String skill;
  final String location;
  final bool isRead;

  const SkillBook({
    required this.id,
    required this.name,
    required this.skill,
    required this.location,
    this.isRead = false,
  });

  factory SkillBook.fromJson(Map<String, dynamic> json,
          {bool isRead = false}) =>
      SkillBook(
        id: json['id'],
        name: json['name'],
        skill: json['skill'],
        location: json['location'],
        isRead: isRead,
      );

  SkillBook copyWith({
    bool? isRead,
  }) =>
      SkillBook(
        id: id,
        name: name,
        skill: skill,
        location: location,
        isRead: isRead ?? this.isRead,
      );
}
