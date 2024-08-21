import 'package:blogapp/components/profile.dart';
import 'package:blogapp/theme/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text(
            "S E T T I N G S",
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Profile(),
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
                      const Icon(FontAwesomeIcons.person)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dark Mode",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                    ),
                    CupertinoSwitch(
                      value: Provider.of<ThemeProvider>(context, listen: false)
                          .isDarkMode,
                      onChanged: (value) =>
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme(),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: signOut,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "LOGOUT",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
                      const Icon(Icons.logout)
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
