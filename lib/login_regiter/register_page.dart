import 'package:blogapp/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blogapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  Future<void> signUp() async {
    if (passCheck()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(), 
        password: _pwController.text.trim(),);
    }else{
      const AlertDialog(content: Text('Password do not match'),);
    }
  }

  bool passCheck(){
    if(_pwController.text.trim() == _confirmPwController.text.trim()){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Theme.of(context).colorScheme.surface,
        backgroundColor: Colors.purple.shade100,
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
              fit: BoxFit.fill,)
          ),
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
                      fontSize: 24, 
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                  ),
                  Text(
                    "Post and see the blogs,",
                    style: TextStyle(
                      fontSize: 20, 
                      // color: Color.fromARGB(255, 242, 196, 10),
                      color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                  ),
                  // const Text(
                  //   "Register Now,",
                  //   style: TextStyle(fontSize: 20, color: Colors.grey),
                  // ),
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
                    height: 5,
                  ),
                  MyTextfield(
                    icon: Icon(
                      Icons.password_rounded,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    text: "Confirm Password",
                    obscure: true,
                    controller: _confirmPwController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: signUp,
                    child: Container(
                      height: 80,
                      width: 360,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 10, 238, 207),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                          child: Text(
                        "SignUp",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account",
                        
                      ),
                      GestureDetector(
                          onTap: onTap,
                          child: Text(
                            "Login Now",
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
