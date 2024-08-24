import 'package:blogapp/admin/admin-pages/manageblogs.dart';
import 'package:blogapp/admin/admin-pages/managecontent.dart';
import 'package:blogapp/admin/admin-pages/manageusers.dart';
// import 'package:blogapp/auth/auth_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  AdminPageState createState() => AdminPageState();
}

class AdminPageState extends State<AdminPage> {
  // Future<void> _signOut() async {
  //   await FirebaseAuth.instance.signOut();

  //   if (mounted) {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const AuthPage()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: const Icon(
          Icons.admin_panel_settings,
          size: 25,
        ),
        title: Text(
          "Welcome Admin",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        // toolbarHeight: 150,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        // actions: [
        //   // Logout button
        //   IconButton(
        //     icon: const Icon(
        //       Icons.logout,
        //       size: 25,
        //     ), 
        //     onPressed: () => _signOut(),
        //   ),
        // ],
        iconTheme: const IconThemeData(size: 30), // Icon size
      ),
      body: SafeArea(
        child: Column(
          children: [
            //  Padding(
            //   padding: const EdgeInsets.only(top:20),
            //   child: Text(
            //     "Welcome Admin",
            //     style: TextStyle(
            //       color: Theme.of(context).colorScheme.inversePrimary,
            //       fontSize: 30,
            //       fontWeight: FontWeight.bold,

            //     ),
            //   ),
            // ),
            // List items
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                title: Text(
                  "Manage Users",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                leading: const Icon(
                  Icons.person_pin_circle,
                  size: 18,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Manageusers()),
                  );
                },
              ),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              title: Text(
                "Manage Blogs",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(
                Icons.article,
                size: 18,
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
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              title: Text(
                "Manage Content",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(
                Icons.content_paste,
                size: 18,
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