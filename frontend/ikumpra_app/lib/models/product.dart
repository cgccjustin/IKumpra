class Product {
  final String id;
  final String name;
  final String description;
  final Category category;
  final double price;
  final String unit;
  final int stock;
  final String freshness;
  final List<String> images;
  final Nutrition? nutrition;
  final bool isAvailable;
  final bool isFeatured;
  final List<String> tags;
  final double? weight;
  final String origin;
  final DateTime? expiryDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.unit,
    required this.stock,
    required this.freshness,
    required this.images,
    this.nutrition,
    required this.isAvailable,
    required this.isFeatured,
    required this.tags,
    this.weight,
    required this.origin,
    this.expiryDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      category: Category.fromJson(json['category']),
      price: (json['price'] ?? 0).toDouble(),
      unit: json['unit'] ?? 'per kg',
      stock: json['stock'] ?? 0,
      freshness: json['freshness'] ?? 'fresh',
      images: List<String>.from(json['images'] ?? []),
      nutrition: json['nutrition'] != null ? Nutrition.fromJson(json['nutrition']) : null,
      isAvailable: json['isAvailable'] ?? true,
      isFeatured: json['isFeatured'] ?? false,
      tags: List<String>.from(json['tags'] ?? []),
      weight: json['weight']?.toDouble(),
      origin: json['origin'] ?? 'Local',
      expiryDate: json['expiryDate'] != null ? DateTime.parse(json['expiryDate']) : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category.toJson(),
      'price': price,
      'unit': unit,
      'stock': stock,
      'freshness': freshness,
      'images': images,
      'nutrition': nutrition?.toJson(),
      'isAvailable': isAvailable,
      'isFeatured': isFeatured,
      'tags': tags,
      'weight': weight,
      'origin': origin,
      'expiryDate': expiryDate?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Product copyWith({
    String? id,
    String? name,
    String? description,
    Category? category,
    double? price,
    String? unit,
    int? stock,
    String? freshness,
    List<String>? images,
    Nutrition? nutrition,
    bool? isAvailable,
    bool? isFeatured,
    List<String>? tags,
    double? weight,
    String? origin,
    DateTime? expiryDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      unit: unit ?? this.unit,
      stock: stock ?? this.stock,
      freshness: freshness ?? this.freshness,
      images: images ?? this.images,
      nutrition: nutrition ?? this.nutrition,
      isAvailable: isAvailable ?? this.isAvailable,
      isFeatured: isFeatured ?? this.isFeatured,
      tags: tags ?? this.tags,
      weight: weight ?? this.weight,
      origin: origin ?? this.origin,
      expiryDate: expiryDate ?? this.expiryDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get formattedPrice => '₱${price.toStringAsFixed(2)}';
  String get mainImage => images.isNotEmpty ? images.first : '';
  bool get hasStock => stock > 0;
  bool get isLowStock => stock <= 10 && stock > 0;
  bool get isOutOfStock => stock == 0;
}

class Category {
  final String id;
  final String name;
  final String? description;
  final String? image;
  final bool isActive;
  final int sortOrder;

  Category({
    required this.id,
    required this.name,
    this.description,
    this.image,
    required this.isActive,
    required this.sortOrder,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] ?? json['id'],
      name: json['name'] ?? '',
      description: json['description'],
      image: json['image'],
      isActive: json['isActive'] ?? true,
      sortOrder: json['sortOrder'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'isActive': isActive,
      'sortOrder': sortOrder,
    };
  }
}

class Nutrition {
  final double? calories;
  final double? protein;
  final double? carbs;
  final double? fat;
  final double? fiber;

  Nutrition({
    this.calories,
    this.protein,
    this.carbs,
    this.fat,
    this.fiber,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      calories: json['calories']?.toDouble(),
      protein: json['protein']?.toDouble(),
      carbs: json['carbs']?.toDouble(),
      fat: json['fat']?.toDouble(),
      fiber: json['fiber']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'carbs': carbs,
      'fat': fat,
      'fiber': fiber,
    };
  }
} 