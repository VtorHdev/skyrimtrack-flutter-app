import 'package:equatable/equatable.dart';

class Shout extends Equatable {
  final String id;
  final String name;
  final String description;
  final List<ShoutWord> words;
  final String cooldown;
  final int wordsLearned;

  const Shout({
    required this.id,
    required this.name,
    required this.description,
    required this.words,
    required this.cooldown,
    this.wordsLearned = 0,
  });

  Shout copyWith({
    String? id,
    String? name,
    String? description,
    List<ShoutWord>? words,
    String? cooldown,
    int? wordsLearned,
  }) {
    return Shout(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      words: words ?? this.words,
      cooldown: cooldown ?? this.cooldown,
      wordsLearned: wordsLearned ?? this.wordsLearned,
    );
  }

  factory Shout.fromJson(Map<String, dynamic> json, {int? wordsLearned}) {
    return Shout(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      words: (json['words'] as List)
          .map((word) => ShoutWord.fromJson(word))
          .toList(),
      cooldown: json['cooldown'],
      wordsLearned: wordsLearned ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        words,
        cooldown,
        wordsLearned,
      ];
}

class ShoutWord extends Equatable {
  final String word;
  final String translation;
  final String location;

  const ShoutWord({
    required this.word,
    required this.translation,
    required this.location,
  });

  factory ShoutWord.fromJson(Map<String, dynamic> json) {
    return ShoutWord(
      word: json['word'],
      translation: json['translation'],
      location: json['location'],
    );
  }

  @override
  List<Object?> get props => [word, translation, location];
}
