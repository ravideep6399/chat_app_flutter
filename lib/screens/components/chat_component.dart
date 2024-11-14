import 'package:chat_app/chat_boxes/reply_chat_box.dart';
import 'package:chat_app/chat_boxes/user_chat_box.dart';
import 'package:chat_app/models/chat_model.dart';
import 'package:chat_app/providers/chat_user_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatComponent extends StatefulWidget {
  final ChatModel source;
  const ChatComponent({super.key, required this.source,});

  @override
  State<ChatComponent> createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  late IO.Socket socket;
  final GlobalKey boxKey = GlobalKey();
  late double width;
  List<Widget> chatlist = [
    const UserChatBox(
      text: "Hello! How are you?",
      read: true,
    ),
    const ReplyChatBox(
      text: "I'm good, thanks! How about you?",
      read: false,
    ),
    const UserChatBox(
      text: "I'm doing great!",
      read: true,
    ),
    const ReplyChatBox(
      text: "Glad to hear that!",
      read: false,
    ),
    const UserChatBox(
      text: "What have you been up to lately?",
      read: true,
    ),
    const ReplyChatBox(
      text: "Just working and staying busy. You?",
      read: false,
    ),
    const UserChatBox(
      text: "Same here. Been focusing a lot on work!",
      read: true,
    ),
    const ReplyChatBox(
      text: "Sounds productive! Keep it up!",
      read: false,
    ),
    const UserChatBox(
      text: "Thanks! You too, stay motivated!",
      read: true,
    ),
    const ReplyChatBox(
      text: "Will do! By the way, have you seen that new movie?",
      read: false,
    ),
    const UserChatBox(
      text: "Not yet, but I plan to. Heard it's really good!",
      read: true,
    ),
    const ReplyChatBox(
      text: "I watched it last night. It was amazing!",
      read: false,
    ),
    const UserChatBox(
      text: "Nice, I can’t wait to watch it then!",
      read: true,
    ),
    const ReplyChatBox(
      text: "Definitely worth it. Let me know what you think!",
      read: false,
    ),
    const UserChatBox(
      text: "Will do! Hey, do you wanna grab lunch sometime?",
      read: true,
    ),
    const ReplyChatBox(
      text: "Sounds great! When are you free?",
      read: false,
    ),
    const UserChatBox(
      text: "How about this weekend?",
      read: true,
    ),
    const ReplyChatBox(
      text: "Perfect! Let’s do it.",
      read: false,
    ),
    const UserChatBox(
      text: "Great! Looking forward to it.",
      read: true,
    ),
    const ReplyChatBox(
      text: "Me too. It’s been a while!",
      read: false,
    ),
    const UserChatBox(
      text: "It has! We definitely need to catch up.",
      read: true,
    ),
    const ReplyChatBox(
      text: "Agreed, let’s make it happen!",
      read: false,
    ),
    const UserChatBox(
      text: "See you soon then!",
      read: true,
    ),
    const ReplyChatBox(
      text: "Take care! Talk to you later.",
      read: false,
    ),
    // Adding more to make it longer
    const UserChatBox(
      text: "By the way, have you been keeping up with the news?",
      read: true,
    ),
    const ReplyChatBox(
      text: "Not much, been too busy. Why, what's happening?",
      read: false,
    ),
    const UserChatBox(
      text: "There’s a new tech breakthrough that’s pretty exciting.",
      read: true,
    ),
    const ReplyChatBox(
      text: "Really? Tell me more!",
      read: false,
    ),
    const UserChatBox(
      text: "It’s a new AI model that can write articles automatically.",
      read: true,
    ),
    const ReplyChatBox(
      text: "Wow, that’s impressive!",
      read: false,
    ),
    const UserChatBox(
      text: "Yeah, the future is looking interesting!",
      read: true,
    ),
    const ReplyChatBox(
      text: "Totally, technology is moving so fast!",
      read: false,
    ),
    const UserChatBox(
      text: "It’s exciting but also a bit scary!",
      read: true,
    ),
    const ReplyChatBox(
      text: "I feel the same. But we’ll see how it unfolds.",
      read: false,
    ),
    const UserChatBox(
      text: "Absolutely. Anyway, let's talk about something lighter.",
      read: true,
    ),
    const ReplyChatBox(
      text: "Sure, what do you have in mind?",
      read: false,
    ),
    const UserChatBox(
      text: "How about your favorite books? Any recommendations?",
      read: true,
    ),
    const ReplyChatBox(
      text: "Oh, definitely! I love reading. I highly recommend 'Sapiens'.",
      read: false,
    ),
    const UserChatBox(
      text: "'Sapiens' sounds interesting, I’ll check it out.",
      read: true,
    ),
    const ReplyChatBox(
      text: "It’s a great read! You won’t regret it.",
      read: false,
    ),
    // Continuing the conversation
    const UserChatBox(
      text: "I’ve been reading a lot of self-improvement books lately.",
      read: true,
    ),
    const ReplyChatBox(
      text: "Nice! I’ve been into that too.",
      read: false,
    ),
    const UserChatBox(
      text:
          "It’s amazing how much you can improve yourself with the right mindset.",
      read: true,
    ),
    const ReplyChatBox(
      text: "Definitely! It’s all about consistency.",
      read: false,
    ),
    const UserChatBox(
      text: "Exactly. Small steps every day make a huge difference.",
      read: true,
    ),
    const ReplyChatBox(
      text: "Agreed! So, what’s the next goal for you?",
      read: false,
    ),
    const UserChatBox(
      text: "I’m focusing on improving my productivity.",
      read: true,
    ),
    const ReplyChatBox(
      text: "That’s awesome! How are you doing that?",
      read: false,
    ),
    const UserChatBox(
      text: "I’ve started using the Pomodoro technique. It’s really helping.",
      read: true,
    ),
    const ReplyChatBox(
      text: "I’ve heard of that. It’s a great method!",
      read: false,
    ),
    const UserChatBox(
      text: "Yes, I’m really liking it. It keeps me focused.",
      read: true,
    ),
    const ReplyChatBox(
      text: "Keep it up, you’re on the right track!",
      read: false,
    ),
    // You can keep adding more to make the list longer as needed
  ];

  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    connect();
    WidgetsBinding.instance.addPostFrameCallback((_) => getWidth());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void connect() async {
    socket = IO.io("http://192.168.202.112:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket.connect();
    socket.emit("signin", widget.source.id);
    socket.onConnect((data) {
      if (kDebugMode) {
        print("connected");
        print(socket.connected);
      }
    });
  }

  void sendMessage(String msg, int sourceId, int targetId) {
    socket.emit("message",
        {"message": msg, "sourceId": sourceId, "targetId": targetId});
  }

  void getWidth() {
    final RenderBox box =
        boxKey.currentContext?.findRenderObject() as RenderBox;
    setState(() {
      width = box.size.width;
    });
    // print("Width: $width");
  }

  @override
  Widget build(BuildContext context) {
    ChatModel selected = Provider.of<ChatUserProvider>(context).currUser;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [Text(selected.name)],
        ),
        leadingWidth: 80,
        titleSpacing: 10,
        surfaceTintColor: Colors.black45,
        backgroundColor: Colors.black45,
        leading: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                  backgroundColor: Colors.white10,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
      body: SizedBox(
        key: boxKey,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [...chatlist],
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        controller: _controller,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 15),
                                onPressed: () {
                                  setState(() {
                                    sendMessage(_controller.text.trim(),
                                        widget.source.id, selected.id);
                                    chatlist.add(Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: UserChatBox(
                                        text: _controller.text.trim(),
                                        read: false,
                                      ),
                                    ));
                                    _controller.text = '';
                                  });
                                },
                                icon: const Icon(Icons.send)),
                            prefixIcon: IconButton(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 10),
                                onPressed: () {},
                                icon: const Icon(Icons.emoji_emotions)),
                            hintText: "Enter your message",
                            contentPadding: const EdgeInsets.all(5),
                            filled: true,
                            fillColor: Colors.black45,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25))),
                      ),
                    )),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.mic),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
