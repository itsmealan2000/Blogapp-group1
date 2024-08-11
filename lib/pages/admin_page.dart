import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.admin_panel_settings), //icon
        title: const Text("Admin Page"), //title
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.blue, //background color
        actions: const [
          //logout button
          Icon(Icons.logout),
          SizedBox(
            width: 20,
          ),
        ],
        iconTheme: const IconThemeData(size: 40), // icon size
        titleTextStyle: const TextStyle( // text style
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: const Center(
        child: Text("Admin Page"),
      ),
    );
  }
}
