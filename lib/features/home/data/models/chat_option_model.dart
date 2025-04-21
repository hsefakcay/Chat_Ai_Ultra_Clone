import '../../domain/entities/chat_option.dart';

class ChatOptionModel extends ChatOption {
  const ChatOptionModel({required super.title, required super.icon, required super.route});

  factory ChatOptionModel.fromJson(Map<String, dynamic> json) {
    return ChatOptionModel(
      title: json['title'] as String,
      icon: json['icon'] as String,
      route: json['route'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'icon': icon, 'route': route};
  }
}
