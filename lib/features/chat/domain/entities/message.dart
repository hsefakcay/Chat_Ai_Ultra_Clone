import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String content;
  final bool isUser;
  final DateTime timestamp;

  Message({required this.content, required this.isUser, DateTime? timestamp})
    : timestamp = timestamp ?? DateTime.now();

  @override
  List<Object> get props => [content, isUser, timestamp];
}
