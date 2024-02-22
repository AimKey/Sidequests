import 'package:flutter/material.dart';
import '../widgets/user_bar.dart';
import '../widgets/form.dart';

class SenderScreen extends StatelessWidget {
  const SenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const UserBar(
          userName: "Minh Kiet12093812930ujlaksd",
          userLocation: "VietNam, Pekistan, Whatever you want!",
        ),
        toolbarHeight: 80,
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "A lot of forms here!",
                style: TextStyle(fontSize: 30, color: Theme.of(context).primaryColor),
              ),
              QuestForm(),
              Container(
                child: Flex(direction: Axis.horizontal, children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Submit"),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
