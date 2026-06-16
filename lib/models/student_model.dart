import 'package:uuid/uuid.dart';

class StudentModel {
  final String id;
  final String classId;
  final String name;
  final String? rollNumber;
  final String? parentContact;
  final String? email;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  StudentModel({
    String? id,
    required this.classId,
    required this.name,
    this.rollNumber,
    this.parentContact,
    this.email,
    this.notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'classId': classId,
      'name': name,
      'rollNumber': rollNumber,
      'parentContact': parentContact,
      'email': email,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      classId: json['classId'],
      name: json['name'],
      rollNumber: json['rollNumber'],
      parentContact: json['parentContact'],
      email: json['email'],
      notes: json['notes'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  StudentModel copyWith({
    String? id,
    String? classId,
    String? name,
    String? rollNumber,
    String? parentContact,
    String? email,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StudentModel(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      name: name ?? this.name,
      rollNumber: rollNumber ?? this.rollNumber,
      parentContact: parentContact ?? this.parentContact,
      email: email ?? this.email,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
