import 'package:chat_app/components/custom_card.dart';
import 'package:chat_app/models/chat_model.dart';
import 'package:chat_app/screens/components/chat_component.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<ChatModel> chatmodels;
  final ChatModel sourceChat;
  const HomeScreen(
      {super.key, required this.chatmodels, required this.sourceChat});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatModel> chatmodels = [];
  @override
  void initState() {
    chatmodels = widget.chatmodels;
    super.initState();
  }

  Widget midBlockUI(
      double windowWidth, double windowHeight, BuildContext context) {
    return Container(
      width: kIsWeb ? windowWidth * 0.3 : windowWidth,
      color: Colors.grey.shade900,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: kIsWeb ? windowWidth * 0.3 * 0.95 : windowWidth * 0.95,
            height: kIsWeb ? windowHeight * 0.07 : 45,
            child: SearchAnchor.bar(
                barHintText: "search",
                viewHintText: "search",
                barShape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
                viewShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return [];
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                  itemCount: chatmodels.length,
                  itemBuilder: (context, index) {
                    return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: CustomCard(
                            chatModel: chatmodels[index],
                            sourchat: widget.sourceChat));
                  }),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double windowWidth = width * 0.98;
    double windowHeight = height * 0.9;
    return Scaffold(
        backgroundColor: Colors.grey.shade700,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          title: const Text("ChatApp"),
          actions: [
            const SizedBox(
              height: 5,
            ),
            !kIsWeb
                ? IconButton(onPressed: () {}, icon: const Icon(Icons.message))
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            !kIsWeb
                ? IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_vert))
                : const SizedBox()
          ],
        ),
        body: kIsWeb
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: windowHeight,
                      width: windowWidth,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Container(
                            width: windowWidth * 0.045,
                            color: Colors.black26,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.message)),
                                const SizedBox(
                                  height: 20,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_vert))
                              ],
                            ),
                          ),
                          midBlockUI(windowWidth, windowHeight, context),
                          Expanded(
                              child: ChatComponent(source: widget.sourceChat)),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : midBlockUI(windowWidth, windowHeight, context));
  }
}
