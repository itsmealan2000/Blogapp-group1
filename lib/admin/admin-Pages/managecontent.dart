import 'package:flutter/material.dart';

class Managecontent extends StatelessWidget {
  const Managecontent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        // leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: (){ Navigator.pop(context).
        // },),
      ),
      body: const Center(child: Text('Contents Manage')),

    );
  }
}