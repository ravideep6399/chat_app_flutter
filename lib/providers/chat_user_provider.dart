import 'package:chat_app/models/chat_model.dart';
import 'package:flutter/foundation.dart';

class ChatUserProvider with ChangeNotifier {
  ChatModel _currUser = ChatModel(
      name: '', icon: '', isGroup: false, time: '', currentMessage: '', id: -1);

  ChatModel get currUser => _currUser;

  setcurrUser(ChatModel value) {
    _currUser = value;
    notifyListeners();
  }
}
