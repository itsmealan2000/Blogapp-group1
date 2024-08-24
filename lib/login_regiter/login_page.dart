import 'package:blogapp/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  LoginPage({super.key,required this.onTap});
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          width:double.infinity,
          height: double.infinity,
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/blog.png'),
              fit: BoxFit.fill)
          ),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
       
                  const SizedBox(height: 200,),
                  const Text('Welcome to Blogging App',
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                  const Text("Post and see the blogs",style: TextStyle(fontSize: 20,color: Colors.grey),),
                  
                  const SizedBox(height: 10,),
                  MyTextfield(
                    icon: const Icon(Icons.email_rounded),
                    controller: _emailController,
                    
                    text: "Email",
                    obscure: false,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyTextfield(
                    icon: const Icon(Icons.password_rounded),
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
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account? ",style: TextStyle(color: Colors.white),),
                      GestureDetector(
                        onTap: onTap,
                        child: Text("Register Now",style: TextStyle(color: Colors.blue.shade600,fontWeight: FontWeight.bold),))
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
