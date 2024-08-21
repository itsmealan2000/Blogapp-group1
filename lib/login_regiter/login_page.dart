import 'package:blogapp/components/my_textfield.dart';
import 'package:blogapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  Future<void> signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _pwController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    themeProvider.isDarkMode
                        ? 'assets/images/blogdark.png'
                        : 'assets/images/blog.png',
                  ),
                  fit: BoxFit.fill)),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(
                  //   FontAwesomeIcons.blog,
                  //   size: 100,
                  //   color: Colors.red.shade300,
                  // ),
                  const SizedBox(
                    height: 300,
                  ),
                  Text(
                    'Welcome to Blogging App',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Post and see the blogs",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextfield(
                    icon: Icon(
                      Icons.email_rounded,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    controller: _emailController,
                    text: "Email",
                    obscure: false,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyTextfield(
                    icon: Icon(
                      Icons.password_rounded,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    text: "Password",
                    obscure: true,
                    controller: _pwController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: signIn,
                    child: Container(
                      height: 80,
                      width: 360,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 10, 238, 207),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                          child: Text(
                        "SignIn",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      GestureDetector(
                          onTap: onTap,
                          child: Text(
                            "Register Now",
                            style: TextStyle(
                                color: Colors.blue.shade600,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
