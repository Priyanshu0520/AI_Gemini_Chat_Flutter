import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatbotapp/hive/chat_history.dart';
import 'package:chatbotapp/providers/chat_provider.dart';
import 'package:chatbotapp/utility/animated_dialog.dart';
import 'package:provider/provider.dart';

class ChatHistoryWidget extends StatelessWidget {
  const ChatHistoryWidget({
    super.key,
    required this.chat,
  });

  final ChatHistory chat;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(chat.chatId),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        bool confirmed = false;
        await showMyAnimatedDialog(
          context: context,
          title: 'Delete Chat',
          content: 'Are you sure you want to delete this chat?',
          actionText: 'Delete',
          onActionPressed: (value) async {
            if (value) {
              // delete the chat
              await context
                  .read<ChatProvider>()
                  .deleteChatMessages(chatId: chat.chatId);

              // delete the chat history
              await chat.delete();
            }
            confirmed = value;
          },
        );
        return confirmed;
      },
      onDismissed: (direction) {
        // Optionally, handle any post-dismiss actions here
      },
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
          leading: const CircleAvatar(
            radius: 30,
            child: Icon(CupertinoIcons.chat_bubble_2),
          ),
          title: Text(
            chat.prompt,
            maxLines: 1,
          ),
          subtitle: Text(
            chat.response,
            maxLines: 2,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () async {
            // navigate to chat screen
            final chatProvider = context.read<ChatProvider>();
            // prepare chat room
            await chatProvider.prepareChatRoom(
              isNewChat: false,
              chatID: chat.chatId,
            );
            chatProvider.setCurrentIndex(newIndex: 1);
            chatProvider.pageController.jumpToPage(1);
          },
        ),
      ),
    );
  }
}
