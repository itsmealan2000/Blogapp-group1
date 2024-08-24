import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        // leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: (){ Navigator.pop(context).
        // },),
      ),
      body: const Center(child: Text('Profile')),

    );
  }
}