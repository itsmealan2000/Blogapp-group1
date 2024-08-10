import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';
import 'package:file_picker/file_picker.dart';

class NewBlogPage extends StatefulWidget {
  const NewBlogPage({super.key});

  @override
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

  XFile? _image;
  File? _file;

  Future<void> _pickMedia() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  Future<void> _captureMedia(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
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

  Future<double> _getAspectRatio(File imageFile) async {
    final completer = Completer<double>();
    final image = Image.file(imageFile);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo imageInfo, bool synchronousCall) {
          final width = imageInfo.image.width.toDouble();
          final height = imageInfo.image.height.toDouble();
          completer.complete(width / height);
        },
      ),
    );
    return completer.future;
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _file = File(result.files.single.path!);
      });
    }
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
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 150,
                          child: ListView(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.camera),
                                title: const Text('Take Photo'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _captureMedia(ImageSource.camera);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.image),
                                title: const Text('Choose from Gallery'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _pickMedia();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[200],
                    ),
                    child: _image == null
                        ? Center(
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[600],
                              size: 40,
                            ),
                          )
                        : FutureBuilder<double>(
                            future: _getAspectRatio(File(_image!.path)),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return const Center(
                                    child: Text('Error loading image'));
                              } else {
                                final aspectRatio = snapshot.data ?? 1;
                                return Center(
                                  child: AspectRatio(
                                    aspectRatio: aspectRatio,
                                    child: Image.file(
                                      File(_image!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }
                            },
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
                  child: const TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write your blog content here...',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple[300],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: _shareContent,
              ),
              IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.white),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 150,
                        child: ListView(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text('Take Photo'),
                              onTap: () {
                                Navigator.pop(context);
                                _captureMedia(ImageSource.camera);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.image),
                              title: const Text('Choose from Gallery'),
                              onTap: () {
                                Navigator.pop(context);
                                _pickMedia();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.attach_file, color: Colors.white),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 75,
                        child: ListView(
                          children: [
                            // ListTile(
                            //   leading: const Icon(Icons.camera),
                            //   title: const Text('Take Photo'),
                            //   onTap: () {
                            //     Navigator.pop(context);
                            //     _captureMedia(ImageSource.camera);
                            //   },
                            // ),
                            // ListTile(
                            //   leading: const Icon(Icons.image),
                            //   title: const Text('Choose from Gallery'),
                            //   onTap: () {
                            //     Navigator.pop(context);
                            //     _pickMedia();
                            //   },
                            // ),
                            ListTile(
                              leading: const Icon(Icons.file_present),
                              title: const Text('Pick a File'),
                              onTap: () {
                                Navigator.pop(context);
                                _pickFile();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              ElevatedButton(
                onPressed: _saveBlog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 4.0,
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
