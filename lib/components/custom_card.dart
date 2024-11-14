import 'package:chat_app/models/chat_model.dart';
import 'package:chat_app/providers/chat_user_provider.dart';
import 'package:chat_app/screens/components/chat_component.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  final ChatModel chatModel;
  final ChatModel sourchat;
  const CustomCard(
      {super.key, required this.chatModel, required this.sourchat});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<ChatUserProvider>(context);
    return InkWell(
      onTap: () {
        pro.setcurrUser(chatModel);
        if (!kIsWeb) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contex) => ChatComponent(
                        source: sourchat,
                      )));
        }
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: Icon(
                chatModel.isGroup ? Icons.group_rounded : Icons.person,
                color: Colors.white,
              ),
            ),
            title: Text(
              chatModel.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  chatModel.currentMessage,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            trailing: Text(chatModel.time),
          ),
        ],
      ),
    );
  }
}
