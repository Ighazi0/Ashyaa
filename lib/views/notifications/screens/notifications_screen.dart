import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'title': 'New Message',
        'subtitle': 'You have a new message from John Doe.',
        'time': '2m ago',
      },
      {
        'title': 'Order Shipped',
        'subtitle': 'Your order has been shipped!',
        'time': '1h ago',
      },
      {
        'title': 'New Friend Request',
        'subtitle': 'Alex sent you a friend request.',
        'time': '3h ago',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  Icons.notifications,
                  color: Colors.blueAccent,
                  size: 30,
                ),
                title: Text(
                  notifications[index]['title']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  notifications[index]['subtitle']!,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                trailing: Text(
                  notifications[index]['time']!,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
