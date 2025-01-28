import 'package:equatable/equatable.dart';

class House extends Equatable {
  final String id;
  final String name;
  final String location;
  final String description;
  final String requirements;
  final bool isDLC;
  final String? dlcName;
  final bool isAcquired;

  const House({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.requirements,
    required this.isDLC,
    this.dlcName,
    this.isAcquired = false,
  });

  House copyWith({
    String? id,
    String? name,
    String? location,
    String? description,
    String? requirements,
    bool? isDLC,
    String? dlcName,
    bool? isAcquired,
  }) {
    return House(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      description: description ?? this.description,
      requirements: requirements ?? this.requirements,
      isDLC: isDLC ?? this.isDLC,
      dlcName: dlcName ?? this.dlcName,
      isAcquired: isAcquired ?? this.isAcquired,
    );
  }

  factory House.fromJson(Map<String, dynamic> json, {bool isAcquired = false}) {
    return House(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      description: json['description'],
      requirements: json['requirements'],
      isDLC: json['isDLC'],
      dlcName: json['dlcName'],
      isAcquired: isAcquired,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        description,
        requirements,
        isDLC,
        dlcName,
        isAcquired,
      ];
}
