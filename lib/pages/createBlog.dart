import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';
// ignore: unused_import
import 'package:file_picker/file_picker.dart';

class NewBlogPage extends StatefulWidget {
  const NewBlogPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewBlogPageState createState() => _NewBlogPageState();
}

class _NewBlogPageState extends State<NewBlogPage> {
  String? _selectedCategory;
  final List<String> _categories = [
    'Food blogs',
    'Travel blogs',
    'Health and fitness blogs',
    'Lifestyle blogs',
    'Fashion and beauty blogs',
    'Photography blogs',
    'Personal blogs',
    'DIY craft blogs',
    'Parenting blogs',
    'Music blogs',
    'Business blogs',
    'Art and design blogs',
    'Book and writing blogs',
    'Personal finance blogs',
    'Interior design blogs',
    'Sports blogs',
    'News blogs',
    'Movie blogs',
    'Religion blogs',
    'Political blogs',
  ];

  XFile? _topImage;
  final List<File> _bottomImages = [];
  // ignore: unused_field
  File? _file;

  get _pickFile => null;

  Future<void> _pickTopImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _topImage = pickedFile;
      });
    }
  }

  Future<void> _captureBottomImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _bottomImages.add(File(pickedFile.path));
      });
    }
  }

  void _shareContent() {
    Share.share('Check out my new blog!');
  }

  void _saveBlog() {
    if (kDebugMode) {
      print('Blog saved');
    }
  }

  void _removeBottomImage(int index) {
    setState(() {
      _bottomImages.removeAt(index);
    });
  }

  void _removeTopImage() {
    setState(() {
      _topImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Blog'),
        backgroundColor: Colors.purple[300],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.purple[100],
        ),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _pickTopImage,
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[200],
                    ),
                    child: _topImage == null
                        ? Center(
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[600],
                              size: 40,
                            ),
                          )
                        : Stack(
                            children: [
                              Center(
                                child: Image.file(
                                  File(_topImage!.path),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: IconButton(
                                  icon: const Icon(Icons.remove_circle,
                                      color: Colors.red),
                                  onPressed: _removeTopImage,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Blog Title',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: 'Enter your blog title',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 4.0),
                  child: DropdownButton<String>(
                    value: _selectedCategory,
                    hint: const Text('Select a category'),
                    isExpanded: true,
                    items: _categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Blog Content',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < _bottomImages.length; i++)
                        Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Image.file(
                                _bottomImages[i],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: IconButton(
                                icon: const Icon(Icons.remove_circle,
                                    color: Colors.red),
                                onPressed: () => _removeBottomImage(i),
                              ),
                            ),
                          ],
                        ),
                      // Add content text field or other widgets here
                      const TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Write your blog content here...',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.purple[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: _shareContent,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    _captureBottomImage(ImageSource.camera);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: () {
                    _captureBottomImage(ImageSource.gallery);
                  },
                ),
                // ignore: prefer_const_constructors
                IconButton(
                  icon: const Icon(Icons.attach_file,color: Colors.black),
                  onPressed: _pickFile,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _saveBlog,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}