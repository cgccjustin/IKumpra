class Order {
  final String id;
  final String orderNumber;
  final String userId;
  final List<OrderItem> items;
  final int totalItems;
  final double subtotal;
  final double deliveryFee;
  final double totalAmount;
  final String status;
  final String paymentMethod;
  final String paymentStatus;
  final Address deliveryAddress;
  final ContactInfo contactInfo;
  final String? deliveryInstructions;
  final DateTime? estimatedDelivery;
  final DateTime? actualDelivery;
  final String? notes;
  final DateTime? cancelledAt;
  final String? cancelledBy;
  final String? cancellationReason;
  final DateTime createdAt;
  final DateTime updatedAt;

  Order({
    required this.id,
    required this.orderNumber,
    required this.userId,
    required this.items,
    required this.totalItems,
    required this.subtotal,
    required this.deliveryFee,
    required this.totalAmount,
    required this.status,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.deliveryAddress,
    required this.contactInfo,
    this.deliveryInstructions,
    this.estimatedDelivery,
    this.actualDelivery,
    this.notes,
    this.cancelledAt,
    this.cancelledBy,
    this.cancellationReason,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'] ?? json['id'],
      orderNumber: json['orderNumber'] ?? '',
      userId: json['user'] ?? '',
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => OrderItem.fromJson(item))
          .toList() ?? [],
      totalItems: json['totalItems'] ?? 0,
      subtotal: (json['subtotal'] ?? 0).toDouble(),
      deliveryFee: (json['deliveryFee'] ?? 0).toDouble(),
      totalAmount: (json['totalAmount'] ?? 0).toDouble(),
      status: json['status'] ?? 'pending',
      paymentMethod: json['paymentMethod'] ?? 'cod',
      paymentStatus: json['paymentStatus'] ?? 'pending',
      deliveryAddress: Address.fromJson(json['deliveryAddress']),
      contactInfo: ContactInfo.fromJson(json['contactInfo']),
      deliveryInstructions: json['deliveryInstructions'],
      estimatedDelivery: json['estimatedDelivery'] != null 
          ? DateTime.parse(json['estimatedDelivery']) 
          : null,
      actualDelivery: json['actualDelivery'] != null 
          ? DateTime.parse(json['actualDelivery']) 
          : null,
      notes: json['notes'],
      cancelledAt: json['cancelledAt'] != null 
          ? DateTime.parse(json['cancelledAt']) 
          : null,
      cancelledBy: json['cancelledBy'],
      cancellationReason: json['cancellationReason'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderNumber': orderNumber,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'totalItems': totalItems,
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'totalAmount': totalAmount,
      'status': status,
      'paymentMethod': paymentMethod,
      'paymentStatus': paymentStatus,
      'deliveryAddress': deliveryAddress.toJson(),
      'contactInfo': contactInfo.toJson(),
      'deliveryInstructions': deliveryInstructions,
      'estimatedDelivery': estimatedDelivery?.toIso8601String(),
      'actualDelivery': actualDelivery?.toIso8601String(),
      'notes': notes,
      'cancelledAt': cancelledAt?.toIso8601String(),
      'cancelledBy': cancelledBy,
      'cancellationReason': cancellationReason,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Order copyWith({
    String? id,
    String? orderNumber,
    String? userId,
    List<OrderItem>? items,
    int? totalItems,
    double? subtotal,
    double? deliveryFee,
    double? totalAmount,
    String? status,
    String? paymentMethod,
    String? paymentStatus,
    Address? deliveryAddress,
    ContactInfo? contactInfo,
    String? deliveryInstructions,
    DateTime? estimatedDelivery,
    DateTime? actualDelivery,
    String? notes,
    DateTime? cancelledAt,
    String? cancelledBy,
    String? cancellationReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Order(
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      totalItems: totalItems ?? this.totalItems,
      subtotal: subtotal ?? this.subtotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      contactInfo: contactInfo ?? this.contactInfo,
      deliveryInstructions: deliveryInstructions ?? this.deliveryInstructions,
      estimatedDelivery: estimatedDelivery ?? this.estimatedDelivery,
      actualDelivery: actualDelivery ?? this.actualDelivery,
      notes: notes ?? this.notes,
      cancelledAt: cancelledAt ?? this.cancelledAt,
      cancelledBy: cancelledBy ?? this.cancelledBy,
      cancellationReason: cancellationReason ?? this.cancellationReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get formattedSubtotal => '₱${subtotal.toStringAsFixed(2)}';
  String get formattedDeliveryFee => '₱${deliveryFee.toStringAsFixed(2)}';
  String get formattedTotal => '₱${totalAmount.toStringAsFixed(2)}';
  bool get isPending => status == 'pending';
  bool get isConfirmed => status == 'confirmed';
  bool get isPreparing => status == 'preparing';
  bool get isShipped => status == 'shipped';
  bool get isDelivered => status == 'delivered';
  bool get isCancelled => status == 'cancelled';
  bool get canBeCancelled => !isDelivered && !isCancelled;
  bool get isPaid => paymentStatus == 'paid';
  bool get isPendingPayment => paymentStatus == 'pending';
  bool get isPaymentFailed => paymentStatus == 'failed';
}

class OrderItem {
  final String id;
  final Product product;
  final String name;
  final int quantity;
  final double price;
  final String unit;
  final double total;
  final DateTime createdAt;
  final DateTime updatedAt;

  OrderItem({
    required this.id,
    required this.product,
    required this.name,
    required this.quantity,
    required this.price,
    required this.unit,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['_id'] ?? json['id'],
      product: Product.fromJson(json['product']),
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
      unit: json['unit'] ?? 'per kg',
      total: (json['total'] ?? 0).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'name': name,
      'quantity': quantity,
      'price': price,
      'unit': unit,
      'total': total,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  String get formattedPrice => '₱${price.toStringAsFixed(2)}';
  String get formattedTotal => '₱${total.toStringAsFixed(2)}';
}

class ContactInfo {
  final String name;
  final String phone;
  final String email;

  ContactInfo({
    required this.name,
    required this.phone,
    required this.email,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
} 