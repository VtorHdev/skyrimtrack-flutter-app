class Enchantment {
  final String id;
  final String name;
  final String effect;
  final String type;
  final String source;
  final int magnitude;
  final bool isLearned;

  const Enchantment({
    required this.id,
    required this.name,
    required this.effect,
    required this.type,
    this.source = '',
    this.magnitude = 0,
    this.isLearned = false,
  });

  factory Enchantment.fromJson(Map<String, dynamic> json,
          {bool isLearned = false}) =>
      Enchantment(
        id: json['id'],
        name: json['name'],
        effect: json['effect'],
        type: json['type'],
        source: json['source'] ?? '',
        magnitude: json['magnitude'] ?? 0,
        isLearned: isLearned,
      );
}
