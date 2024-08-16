import 'package:blogapp/admin/admin-Pages/manageblogs.dart';
import 'package:blogapp/admin/admin-Pages/managecontent.dart';
import 'package:blogapp/admin/admin-Pages/manageusers.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: const Icon(Icons.admin_panel_settings), //icon
        title: Text(
          "Admin Page",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ), //title
        toolbarHeight: 100,
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
        titleTextStyle: const TextStyle(
          // text style
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                "Welcome Admin",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
//listitems
            ListTile(//manage users
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              title: const Text(
                "Manage Users",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(
                Icons.person_pin_circle,
                size: 40,
                ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Manageusers()),
                );
              },
            ),
            ListTile(//manageblogs
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              title: const Text(
                "Manage Blogs",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(
                Icons.article,
                size: 40,
                ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Manageblogs()),
                );
              },
            ),
            ListTile(//manage Contents
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              title: const Text(
                "Manage Content",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(
                Icons.content_paste,
                size: 40,
                ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Managecontent()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
