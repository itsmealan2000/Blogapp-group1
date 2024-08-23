import 'package:flutter/material.dart';
import 'create_page.dart';

class CreateBlogPage extends StatefulWidget {
  final String? initialTitle;
  final String? initialContent;

  const CreateBlogPage({
    this.initialTitle,
    this.initialContent,
    super.key,
  });

  @override
  _CreateBlogPageState createState() => _CreateBlogPageState();
}

class _CreateBlogPageState extends State<CreateBlogPage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle);
    _contentController = TextEditingController(text: widget.initialContent);
  }

  void _saveBlog() {
    final String title = _titleController.text;
    final String content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            title: title,
            content: content,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in both title and content')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Create Blog',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
              style: const TextStyle(
                fontSize: 24.0, // Increase the font size here
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                hintText: 'Content',
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: _saveBlog,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child:  Text('Next',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,fontSize: 18),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}