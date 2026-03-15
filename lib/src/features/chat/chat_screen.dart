import 'package:flutter/material.dart';

import '../../app/hastiq_scope.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.title});

  final String title;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendPrompt(String text) {
    HastiqScope.of(context).sendMessage(text);
  }

  @override
  Widget build(BuildContext context) {
    final state = HastiqScope.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Wrap(
            spacing: 8,
            children: [
              ActionChip(
                label: const Text('Schedule Interview'),
                onPressed: () => _sendPrompt('Can we schedule an interview?'),
              ),
              ActionChip(
                label: const Text('Send Portfolio'),
                onPressed: () => _sendPrompt('Here is my portfolio link.'),
              ),
              ActionChip(
                label: const Text('Attach PDF Resume'),
                onPressed: () => _sendPrompt('[PDF Resume attached]'),
              ),
              ActionChip(
                label: const Text('Attach Image'),
                onPressed: () => _sendPrompt('[Image attachment]'),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: state.messages.length,
              itemBuilder: (_, i) {
                final msg = state.messages[i];
                return ListTile(
                  title: Text(msg.body),
                  subtitle: Text(msg.sender),
                  trailing: Text('${msg.time.hour.toString().padLeft(2, '0')}:${msg.time.minute.toString().padLeft(2, '0')}'),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(hintText: 'Type a message...'),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_controller.text.trim().isEmpty) return;
                      _sendPrompt(_controller.text.trim());
                      _controller.clear();
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
