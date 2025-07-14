class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;
  final String unit;
  final String freshness;
  final bool isAvailable;
  final int stockQuantity;
  final double rating;
  final int reviewCount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.unit,
    required this.freshness,
    required this.isAvailable,
    required this.stockQuantity,
    this.rating = 0.0,
    this.reviewCount = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      unit: json['unit'] ?? '',
      freshness: json['freshness'] ?? '',
      isAvailable: json['isAvailable'] ?? true,
      stockQuantity: json['stockQuantity'] ?? 0,
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'category': category,
      'unit': unit,
      'freshness': freshness,
      'isAvailable': isAvailable,
      'stockQuantity': stockQuantity,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? image,
    String? category,
    String? unit,
    String? freshness,
    bool? isAvailable,
    int? stockQuantity,
    double? rating,
    int? reviewCount,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      category: category ?? this.category,
      unit: unit ?? this.unit,
      freshness: freshness ?? this.freshness,
      isAvailable: isAvailable ?? this.isAvailable,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
    );
  }
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