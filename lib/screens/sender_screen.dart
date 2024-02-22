import 'package:flutter/material.dart';
import '../widgets/user_bar.dart';
import '../widgets/quest_form.dart';

class SenderScreen extends StatefulWidget {
  final String currentLocation;
  const SenderScreen({required this.currentLocation, Key? key}) : super(key: key);

  @override
  State<SenderScreen> createState() => _SenderScreenState();
}

class _SenderScreenState extends State<SenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: UserBar(
          userName: "Minh Kiet12093812930ujlaksd",
          userLocation: widget.currentLocation,
        ),
        toolbarHeight: 80,
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Create a new Quest!",
                style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const QuestForm(currentLocation: "VietNam, Pekistan, Whatever you want!"),
              // TODO: Material navigation style
              BottomAppBar(
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.home, color: Colors.white, size: 30),
                    Icon(Icons.add, color: Colors.white, size: 30),
                    Icon(Icons.person, color: Colors.white, size: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
