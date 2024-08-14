import 'package:flutter/material.dart';

class Manageusers extends StatelessWidget {
  const Manageusers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        // leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: (){ Navigator.pop(context).
        // },),
      ),
      body: const Center(child: Text('users')),

    );
  }
}