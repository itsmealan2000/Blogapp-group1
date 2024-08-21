import 'package:blogapp/login_regiter/login_or_register.dart';
import 'package:blogapp/pages/home_page.dart';
import 'package:blogapp/admin/admin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final User? user = snapshot.data;
            if (user != null) {
              if (user.email == 'admin@gmail.com') {
                return const AdminPage();
              } else {
                return const HomePage();
              }
            }
          } 
          return const LoginOrRegister();
        },
      ),
    );
  }
}
