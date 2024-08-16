//pages
// import 'package:blogapp/auth/auth_page.dart';
//import 'package:blogapp/pages/home_page.dart';
import 'package:blogapp/admin/admin_page.dart';
import 'package:blogapp/firebase_options.dart';
import 'package:blogapp/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(),
    child: const MainApp(),)
    );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BLOG APP",
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      //home:  const SplashPage()
      // home: const AuthPage(),
      home: const AdminPage(),
    );
  }
}
