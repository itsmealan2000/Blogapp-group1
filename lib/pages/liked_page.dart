import 'package:flutter/material.dart';


class LikedPage extends StatelessWidget {
  const LikedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const Center(child: Text("Liked Page")),
    );
  }
}