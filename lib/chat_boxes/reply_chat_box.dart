import 'package:flutter/material.dart';

class ReplyChatBox extends StatelessWidget {
  final String text;
  final bool read;
  const ReplyChatBox({super.key, required this.text, required this.read});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            color: Colors.white,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 40, top: 5, bottom: 20),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Text(
                    TimeOfDay.now().format(context).toString(),
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
