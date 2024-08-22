import 'package:blogapp/admin/admin-Pages/manageblogs.dart';
import 'package:blogapp/admin/admin-Pages/managecontent.dart';
import 'package:blogapp/admin/admin-Pages/manageusers.dart';
import 'package:blogapp/auth/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  AdminPageState createState() => AdminPageState();
}

class AdminPageState extends State<AdminPage> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: const Icon(
          Icons.admin_panel_settings,
          size: 50,
        ),
        title: Text(
          "Admin Page",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 150,
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          // Logout button
          IconButton(
            icon: const Icon(
              Icons.logout,
              size: 50,
            ),
            onPressed: () => _signOut(),
          ),
        ],
        iconTheme: const IconThemeData(size: 30), // Icon size
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Welcome Admin",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // List items
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: const Text(
                "Manage Users",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(
                Icons.person_pin_circle,
                size: 35,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Manageusers()),
                );
              },
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: const Text(
                "Manage Blogs",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(
                Icons.article,
                size: 35,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ManageBlogs()),
                );
              },
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: const Text(
                "Manage Content",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(
                Icons.content_paste,
                size: 35,
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
