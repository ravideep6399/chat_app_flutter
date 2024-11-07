import 'package:chat_app/screens/components/chat_component.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget midBlockUI(
      double windowWidth, double windowHeight, BuildContext context) {
    return Container(
      width: windowWidth * 0.3,
      color: Colors.grey.shade900,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: windowWidth * 0.3 * 0.95,
            height: windowHeight * 0.07,
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
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        leading: const CircleAvatar(
                            backgroundColor: Colors.white10,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            )),
                        title: const Text("Name"),
                        minTileHeight: 70,
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("clicked")));
                        },
                      ),
                    );
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
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: windowHeight,
                width: windowWidth,
                decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5)
                ),
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
                    Expanded(child: ChatComponent()),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
