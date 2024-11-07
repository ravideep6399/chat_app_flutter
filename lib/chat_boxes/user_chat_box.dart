import 'package:flutter/material.dart';

class UserChatBox extends StatelessWidget {
  final String text;
  final bool read;
  const UserChatBox({super.key, required this.text, required this.read});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            color: Colors.black54,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 60, top: 5, bottom: 20),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(
                    children: [
                      Text(
                        TimeOfDay.now().format(context).toString(),
                        style:
                            const TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.done_all_rounded,
                        color: read ? Colors.blue : Colors.grey,
                        size: 18,
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
