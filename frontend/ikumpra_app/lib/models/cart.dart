import 'package:ikumpra_app/models/product.dart';

class Cart {
  final String id;
  final String userId;
  final List<CartItem> items;
  final int totalItems;
  final double totalAmount;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  Cart({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalItems,
    required this.totalAmount,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['_id'] ?? json['id'],
      userId: json['user'] ?? '',
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => CartItem.fromJson(item))
          .toList() ?? [],
      totalItems: json['totalItems'] ?? 0,
      totalAmount: (json['totalAmount'] ?? 0).toDouble(),
      isActive: json['isActive'] ?? true,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'totalItems': totalItems,
      'totalAmount': totalAmount,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Cart copyWith({
    String? id,
    String? userId,
    List<CartItem>? items,
    int? totalItems,
    double? totalAmount,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Cart(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      totalItems: totalItems ?? this.totalItems,
      totalAmount: totalAmount ?? this.totalAmount,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get formattedTotal => '₱${totalAmount.toStringAsFixed(2)}';
  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;
}

class CartItem {
  final String id;
  final Product product;
  final int quantity;
  final double price;
  final String unit;
  final DateTime createdAt;
  final DateTime updatedAt;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.price,
    required this.unit,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['_id'] ?? json['id'],
      product: Product.fromJson(json['product']),
      quantity: json['quantity'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
      unit: json['unit'] ?? 'per kg',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
      'price': price,
      'unit': unit,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  CartItem copyWith({
    String? id,
    Product? product,
    int? quantity,
    double? price,
    String? unit,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      unit: unit ?? this.unit,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  double get total => price * quantity;
  String get formattedTotal => '₱${total.toStringAsFixed(2)}';
  String get formattedPrice => '₱${price.toStringAsFixed(2)}';
  bool get isAvailable => product.isAvailable && product.hasStock;
  bool get isLowStock => product.isLowStock;
  bool get isOutOfStock => product.isOutOfStock;
} 