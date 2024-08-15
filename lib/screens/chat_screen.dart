import 'package:chatbotapp/screens/dash_board_screen.dart';
import 'package:chatbotapp/widgets/gradient_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatbotapp/providers/chat_provider.dart';
import 'package:chatbotapp/utility/animated_dialog.dart';
import 'package:chatbotapp/widgets/bottom_chat_field.dart';
import 'package:chatbotapp/widgets/chat_messages.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // scroll controller
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients &&
          _scrollController.position.maxScrollExtent > 0.0) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        if (chatProvider.inChatMessages.isNotEmpty) {
          _scrollToBottom();
        }

        chatProvider.addListener(() {
          if (chatProvider.inChatMessages.isNotEmpty) {
            _scrollToBottom();
          }
        });

        return GradientScaffold(
           appBar: AppBar(
               backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const OutlinedTextWidget(
                text: "Chat with Gemini",
                fontSize: 20.0,
                textColor: Colors.black38,
                outlineColor: Colors.black38,
              ),
            actions: [
              if (chatProvider.inChatMessages.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: IconButton(
                      icon: const Icon(CupertinoIcons.add),
                      onPressed: () async {
                        showMyAnimatedDialog(
                          context: context,
                          title: 'Start New Chat',
                          content: 'Are you sure you want to start a new chat?',
                          actionText: 'Yes',
                          onActionPressed: (value) async {
                            if (value) {
                              await chatProvider.prepareChatRoom(
                                  isNewChat: true, chatID: '');
                            }
                          },
                        );
                      },
                    ),
                  ),
                )
            ],
          ),

          body: Stack(
            children: [SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: chatProvider.inChatMessages.isEmpty
                          ? const Center(
                              child: const OutlinedTextWidget(
                text: "No message yet",
                fontSize: 20.0,
                textColor: Colors.black38,
                outlineColor: Colors.black38,
              ),
                            )
                          : ChatMessages(
                              scrollController: _scrollController,
                              chatProvider: chatProvider,
                            ),
                    ),
            
                    // input field
                    BottomChatField(
                      chatProvider: chatProvider,
                    )
                  ],
                ),
              ),
            ),
            
        ]  ),
        
        );
      },
    );
  }
}
