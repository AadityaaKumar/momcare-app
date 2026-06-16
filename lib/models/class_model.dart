import 'package:uuid/uuid.dart';

class ClassModel {
  final String id;
  final String className;
  final String grade;
  final String? section;
  final int? totalStudents;
  final DateTime createdAt;
  final DateTime updatedAt;

  ClassModel({
    String? id,
    required this.className,
    required this.grade,
    this.section,
    this.totalStudents,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'className': className,
      'grade': grade,
      'section': section,
      'totalStudents': totalStudents,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['id'],
      className: json['className'],
      grade: json['grade'],
      section: json['section'],
      totalStudents: json['totalStudents'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  ClassModel copyWith({
    String? id,
    String? className,
    String? grade,
    String? section,
    int? totalStudents,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ClassModel(
      id: id ?? this.id,
      className: className ?? this.className,
      grade: grade ?? this.grade,
      section: section ?? this.section,
      totalStudents: totalStudents ?? this.totalStudents,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
