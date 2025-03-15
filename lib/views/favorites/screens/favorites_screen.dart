import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> favoriteItems = [
      {'title': 'Item 1', 'image': 'https://via.placeholder.com/150'},
      {'title': 'Item 2', 'image': 'https://via.placeholder.com/150'},
      {'title': 'Item 3', 'image': 'https://via.placeholder.com/150'},
    ];
    return SafeArea(
      child: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(favoriteItems[index]['image']!),
              ),
              title: Text(
                favoriteItems[index]['title']!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              trailing: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  // Remove from favorites logic
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
