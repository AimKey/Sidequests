import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'sender_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: Update this according to user position
      home: SenderScreen(currentLocation: "VietNam, Pekistan, Whatever you want!"),
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 26, 37, 48),
        hintColor: const Color.fromARGB(255, 91, 158, 225),
        unselectedWidgetColor: const Color.fromARGB(255, 26, 37, 48),
      ),
    );
  }
}
