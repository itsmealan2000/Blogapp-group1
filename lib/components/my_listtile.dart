import 'package:flutter/material.dart';

class MyListtile extends StatelessWidget {
   MyListtile({super.key});
  final TextEditingController contentController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.secondary
              ),
            ),
            Text(contentController.text)
          ],
        ),
      ),
    );
  }
}