class ChatMessage {
  final String id;
  final String text;
  final bool isFromUser;
  final DateTime timestamp;
  final String senderName;
  final String? imageUrl;
  final bool isRead;

  ChatMessage({
    required this.id,
    required this.text,
    required this.isFromUser,
    required this.timestamp,
    required this.senderName,
    this.imageUrl,
    this.isRead = false,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'] ?? '',
      text: json['text'] ?? '',
      isFromUser: json['isFromUser'] ?? false,
      timestamp: DateTime.parse(json['timestamp']),
      senderName: json['senderName'] ?? '',
      imageUrl: json['imageUrl'],
      isRead: json['isRead'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'isFromUser': isFromUser,
      'timestamp': timestamp.toIso8601String(),
      'senderName': senderName,
      'imageUrl': imageUrl,
      'isRead': isRead,
    };
  }

  ChatMessage copyWith({
    String? id,
    String? text,
    bool? isFromUser,
    DateTime? timestamp,
    String? senderName,
    String? imageUrl,
    bool? isRead,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      text: text ?? this.text,
      isFromUser: isFromUser ?? this.isFromUser,
      timestamp: timestamp ?? this.timestamp,
      senderName: senderName ?? this.senderName,
      imageUrl: imageUrl ?? this.imageUrl,
      isRead: isRead ?? this.isRead,
    );
  }
} 