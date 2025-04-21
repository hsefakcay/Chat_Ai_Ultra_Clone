class Chat {
  final String id;
  final String title;
  final DateTime createdAt;
  final bool isStarred;
  final String lastMessage;

  const Chat({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.isStarred,
    required this.lastMessage,
  });
}
