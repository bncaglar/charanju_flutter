class ChatModule {
  final bool isOwnMessage;
  final String? messages;

  const ChatModule({
    required this.isOwnMessage,
    this.messages,
  });
}
