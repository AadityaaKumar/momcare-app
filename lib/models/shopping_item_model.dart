import 'package:uuid/uuid.dart';

class ShoppingItemModel {
  final String id;
  final String itemName;
  final String category; // Vegetables, Fruits, Dairy, etc.
  final double? quantity;
  final String? unit;
  final bool isPurchased;
  final double? price;
  final DateTime createdAt;
  final DateTime updatedAt;

  ShoppingItemModel({
    String? id,
    required this.itemName,
    required this.category,
    this.quantity,
    this.unit,
    this.isPurchased = false,
    this.price,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemName': itemName,
      'category': category,
      'quantity': quantity,
      'unit': unit,
      'isPurchased': isPurchased ? 1 : 0,
      'price': price,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory ShoppingItemModel.fromJson(Map<String, dynamic> json) {
    return ShoppingItemModel(
      id: json['id'],
      itemName: json['itemName'],
      category: json['category'],
      quantity: json['quantity'],
      unit: json['unit'],
      isPurchased: (json['isPurchased'] ?? 0) == 1,
      price: json['price'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  ShoppingItemModel copyWith({
    String? id,
    String? itemName,
    String? category,
    double? quantity,
    String? unit,
    bool? isPurchased,
    double? price,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ShoppingItemModel(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      isPurchased: isPurchased ?? this.isPurchased,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
