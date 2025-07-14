class Address {
  final String id;
  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String? landmark;
  final bool isDefault;
  final String? label; // e.g., "Home", "Work"

  Address({
    required this.id,
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    this.landmark,
    required this.isDefault,
    this.label,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] ?? '',
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      zipCode: json['zipCode'] ?? '',
      country: json['country'] ?? '',
      landmark: json['landmark'],
      isDefault: json['isDefault'] ?? false,
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'street': street,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'country': country,
      'landmark': landmark,
      'isDefault': isDefault,
      'label': label,
    };
  }

  Address copyWith({
    String? id,
    String? street,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    String? landmark,
    bool? isDefault,
    String? label,
  }) {
    return Address(
      id: id ?? this.id,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      landmark: landmark ?? this.landmark,
      isDefault: isDefault ?? this.isDefault,
      label: label ?? this.label,
    );
  }

  String get fullAddress {
    final parts = [street, city, state, zipCode, country];
    return parts.where((part) => part.isNotEmpty).join(', ');
  }
} 