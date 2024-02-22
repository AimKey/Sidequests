import 'package:flutter/material.dart';
import 'sender_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SenderScreen(),
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 26, 37, 48),
        hintColor: const Color.fromARGB(255, 91, 158, 225),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 25),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
