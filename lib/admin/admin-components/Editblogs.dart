import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditBlogs extends StatefulWidget {
  final String docId;
  final String currentTitle;
  final String currentContent;

  const EditBlogs({
    Key? key,
    required this.docId,
    required this.currentTitle,
    required this.currentContent,
  }) : super(key: key);

  @override
  _EditBlogsState createState() => _EditBlogsState();
}

class _EditBlogsState extends State<EditBlogs> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.currentTitle);
    _contentController = TextEditingController(text: widget.currentContent);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    await FirebaseFirestore.instance
        .collection('Blogs')
        .doc(widget.docId)
        .update({
      'title': _titleController.text,
      'content': _contentController.text,
    });

    Navigator.of(context).pop();  // Go back to the previous screen
  }

  Future<void> _deleteBlog() async {
    await FirebaseFirestore.instance
        .collection('Blogs')
        .doc(widget.docId)
        .delete();

    Navigator.of(context).pop();  // Go back to the previous screen after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Blog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'Content',
              ),
              maxLines: 10,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _saveChanges,
                  child: const Text('Save Changes'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _deleteBlog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Delete Blog'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
