import 'package:flutter/material.dart';

class Manageblogs extends StatelessWidget {
  const Manageblogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        // leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: (){ Navigator.pop(context).
        // },),
      ),
      body: const Center(child: Text('Blogs Manage')),

    );
  }
}