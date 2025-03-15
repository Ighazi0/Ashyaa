import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            title: Text(
              'User $index',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              'Last message preview...',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            trailing: Text(
              '2m ago',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () {
              // Navigate to chat screen
            },
          );
        },
      ),
    );
  }
}
