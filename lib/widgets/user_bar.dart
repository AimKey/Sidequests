import 'package:flutter/material.dart';

class UserBar extends StatelessWidget {
  final String userName;
  final String userLocation;

  const UserBar({this.userName = "User", required this.userLocation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: [
          const Expanded(
            // flex: 1,
            child: Icon(Icons.settings, color: Colors.white, size: 30),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Text(
                  "Hello $userName!",
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.white, size: 15),
                    Flexible(
                      child: Text(
                        userLocation,
                        style: const TextStyle(color: Colors.white, fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            // flex: 1,
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              // TODO: Update this according to user image
              backgroundImage: AssetImage("lib/assets/Sakuta.jpg"),
              radius: 20,
            ),
          ),
        ],
      ),
    );
  }
}
