import 'package:chat_app/feature/home/models/chat_model.dart';
import 'package:chat_app/feature/home/view/components/chat_tile.dart';
import 'package:chat_app/feature/home/view/widgets/search_bar_for_home.dart';
import 'package:chat_app/feature/home/view/widgets/show_exit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenHome extends ConsumerWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        final canPop = await showExitDialog(context);
        if (canPop && context.mounted) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('WhatsApp')),
        body: ListView(
          children: [
            SearchBarForHome(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: demoChats.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final chat = demoChats[index];
                final isVisible = index == 1 || index == 3;
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ChatTile(
                    chat: chat,
                    isVisible: isVisible,
                    onTap: () {},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<ChatModel> demoChats = [
  ChatModel(
    chatId: "user1_user2",
    participants: ["user1", "user2"],
    lastMessage: "Hey, how are you?",
    lastMessageTime: DateTime.now().subtract(Duration(minutes: 5)),
  ),
  ChatModel(
    chatId: "user3_user4user3_user4user3_user4user3_user4",
    participants: ["user3", "user4"],
    lastMessage: "See you tomorrow!",
    lastMessageTime: DateTime.now().subtract(Duration(hours: 1)),
  ),
  ChatModel(
    chatId: "user5_user6",
    participants: ["user5", "user6"],
    lastMessage: "Let's catch up later.",
    lastMessageTime: DateTime.now().subtract(Duration(days: 1)),
  ),
  ChatModel(
    chatId: "user7_user8",
    participants: ["user7", "user8"],
    lastMessage: "Did you check the new update?",
    lastMessageTime: DateTime.now().subtract(Duration(minutes: 30)),
  ),
  ChatModel(
    chatId: "user9_user10",
    participants: ["user9", "user10"],
    lastMessage: "I'll send the files soon. Did you check the new update?",
    lastMessageTime: DateTime.now().subtract(Duration(hours: 2)),
  ),
  ChatModel(
    chatId: "user2_user3",
    participants: ["user2", "user3"],
    lastMessage: "Great job on the project!",
    lastMessageTime: DateTime.now().subtract(Duration(days: 2)),
  ),
];
