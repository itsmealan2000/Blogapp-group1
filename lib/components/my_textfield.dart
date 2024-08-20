import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String text;
  final bool obscure;
  final TextEditingController controller;
  final Widget icon;
  const MyTextfield({
    super.key,
    required this.text,
    required this.obscure,
    required this.controller,
    required this.icon
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15.0,right: 15.0),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(15),
          ),
          hintText: text,
          icon: icon,
        ),
      ),
    );
  }
}