import 'package:charanju_flutter/helper/modules/chat_module.dart';

class ChatData {
  static var chats = <ChatModule>[
    ChatModule(
        isOwnMessage: false,
        messages:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed "),
    ChatModule(
        isOwnMessage: true,
        messages:
            "Do eiusmod tempor incididunt ut labore et dolore magaliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
    ChatModule(
        isOwnMessage: false,
        messages: "Duis aute irure dolor in reprehenderit in voluptate velit "),
    ChatModule(
        isOwnMessage: false,
        messages: "Duis aute irure dolor in reprehenderit in voluptate velit "),
    ChatModule(
        isOwnMessage: true,
        messages:
            "Do eiusmod tempor incididunt ut labore et dolore magaliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
    ChatModule(
        isOwnMessage: false,
        messages: "Duis aute irure dolor in reprehenderit in voluptate velit "),
    ChatModule(
        isOwnMessage: true,
        messages: "Duis aute irure dolor in reprehenderit in voluptate velit "),
    ChatModule(
        isOwnMessage: false,
        messages: "Duis aute irure dolor in reprehenderit in voluptate velit "),
    ChatModule(
        isOwnMessage: false,
        messages: "Duis aute irure dolor in reprehenderit in voluptate velit "),
    ChatModule(
        isOwnMessage: true,
        messages:
            "Do eiusmod tempor incididunt ut labore et dolore magaliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
  ];

  static List<ChatModule> items = List.of(ChatData.chats);
}
