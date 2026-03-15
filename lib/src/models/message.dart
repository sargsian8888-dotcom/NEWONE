class Message {
  const Message({
    required this.sender,
    required this.body,
    required this.time,
  });

  final String sender;
  final String body;
  final DateTime time;
}
