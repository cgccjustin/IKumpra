class Address {
  final String id;
  final String street;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final String? apartment;
  final String? landmark;
  final bool isDefault;
  final DateTime createdAt;
  final DateTime updatedAt;

  Address({
    required this.id,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    this.apartment,
    this.landmark,
    required this.isDefault,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] ?? json['_id'],
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      postalCode: json['postalCode'] ?? '',
      apartment: json['apartment'],
      landmark: json['landmark'],
      isDefault: json['isDefault'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'postalCode': postalCode,
      'apartment': apartment,
      'landmark': landmark,
      'isDefault': isDefault,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Address copyWith({
    String? id,
    String? street,
    String? city,
    String? state,
    String? country,
    String? postalCode,
    String? apartment,
    String? landmark,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Address(
      id: id ?? this.id,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      postalCode: postalCode ?? this.postalCode,
      apartment: apartment ?? this.apartment,
      landmark: landmark ?? this.landmark,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get fullAddress {
    final parts = [street];
    if (apartment != null && apartment!.isNotEmpty) {
      parts.add('Apt $apartment');
    }
    parts.addAll([city, state, postalCode, country]);
    return parts.where((part) => part.isNotEmpty).join(', ');
  }

  String get shortAddress {
    return '$street, $city';
  }
} 