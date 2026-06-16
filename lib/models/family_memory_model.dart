import 'package:uuid/uuid.dart';

class FamilyMemoryModel {
  final String id;
  final String title;
  final String? description;
  final String? imagePath;
  final DateTime date;
  final String? category; // Birthday, Anniversary, Vacation, etc.
  final bool isFavorite;
  final DateTime createdAt;
  final DateTime updatedAt;

  FamilyMemoryModel({
    String? id,
    required this.title,
    this.description,
    this.imagePath,
    required this.date,
    this.category,
    this.isFavorite = false,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imagePath': imagePath,
      'date': date.toIso8601String(),
      'category': category,
      'isFavorite': isFavorite ? 1 : 0,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory FamilyMemoryModel.fromJson(Map<String, dynamic> json) {
    return FamilyMemoryModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imagePath: json['imagePath'],
      date: DateTime.parse(json['date']),
      category: json['category'],
      isFavorite: (json['isFavorite'] ?? 0) == 1,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  FamilyMemoryModel copyWith({
    String? id,
    String? title,
    String? description,
    String? imagePath,
    DateTime? date,
    String? category,
    bool? isFavorite,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FamilyMemoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      date: date ?? this.date,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
