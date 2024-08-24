// import 'package:blogapp/pages/home_page.dart';
// import 'package:blogapp/pages/main_page.dart';
// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  final String title;
  final String content;
  final String? category;

   PreviewPage({
    required this.title,
    required this.content,
    this.category,
    super.key,
  });
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  void _saveBlog(BuildContext context) async{
    final blog = {
      'title': title,
      'content': content,
      'category': category,
    };
    if (title.isNotEmpty && content.isNotEmpty) {
      await _firestore.collection('Blogs').add({
        'title': title,
        'content': content,
        'timestamp': FieldValue.serverTimestamp(),
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Content Uploaded Successfully')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill in both fields')));
    }
    Navigator.pop(context);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            if (category != null) ...[
              const SizedBox(height: 10.0),
              Text(
                'Category: $category',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
            ],
            const SizedBox(height: 20.0),
            Text(
              content,
              style: const TextStyle(fontSize: 16.0),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Edit'),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      _saveBlog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Save'),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}