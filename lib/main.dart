import 'package:chat_app/providers/chat_user_provider.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatUserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme.highContrastDark(),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
