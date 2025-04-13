import '../../domain/entities/message.dart';

class MessageModel extends Message {
  MessageModel({required super.content, required super.isUser, super.timestamp});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      content: json['content'],
      isUser: json['isUser'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'content': content, 'isUser': isUser, 'timestamp': timestamp.toIso8601String()};
  }

  factory MessageModel.fromBot(String content) {
    return MessageModel(content: content, isUser: false);
  }

  factory MessageModel.fromUser(String content) {
    return MessageModel(content: content, isUser: true);
  }
}
