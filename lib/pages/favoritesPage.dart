import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Blogs")
            .where('isFavorite', isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var blogDoc = snapshot.data!.docs[index];
                  return ListTile(
                    title: Text("${blogDoc["title"]}"),
                    subtitle: Text("${blogDoc["content"]}"),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.hasError.toString()));
            } else {
              return const Center(child: Text('No favorite blogs found.'));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
