import 'package:flutter/material.dart';

class NewBlogPage extends StatefulWidget {
  const NewBlogPage({super.key});

  @override
  _NewBlogPageState createState() => _NewBlogPageState();
}

class _NewBlogPageState extends State<NewBlogPage> {
  String? _selectedCategory; // Variable to hold the selected category
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Blog'),
        backgroundColor:
            Colors.purple[300], // Optional: Change AppBar color if desired
      ),
      body: Container(
        color: Colors.purple[100], // Light purple background color for the body
        padding: const EdgeInsets.all(20.0), // Add padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Blog Title',
              style: TextStyle(
                fontSize: 22, // Increased font size for the label
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
                height:
                    15), // Increased spacing between the label and text field
            TextField(
              style: const TextStyle(
                fontSize: 20, // Increased font size for the text field content
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                hintText: 'Enter your blog title',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0), // Padding inside the text field
              ),
            ),
            const SizedBox(
                height: 20), // Spacing between the title box and dropdown
            const Text(
              'Category',
              style: TextStyle(
                fontSize: 22, // Increased font size for the label
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
                height: 10), // Spacing between the label and dropdown
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(8.0), // Rounded corners for the box
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 2.0, // Border width
                ),
                color: Colors.white, // Background color for the box
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 12.0, vertical: 4.0), // Padding inside the box
              child: DropdownButton<String>(
                value: _selectedCategory,
                hint: const Text('Select a category'),
                isExpanded: true, // Expand to fill the available width
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
            const SizedBox(
                height: 20), // Spacing between the dropdown and text area
            const Text(
              'Blog Content',
              style: TextStyle(
                fontSize: 22, // Increased font size for the label
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
                height: 10), // Spacing between the label and text field
            Container(
              padding:
                  const EdgeInsets.all(12.0), // Padding inside the container
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(8.0), // Rounded corners for the box
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 2.0, // Border width
                ),
                color: Colors.white, // Background color for the box
              ),
              child: const TextField(
                maxLines: null, // Allows the text field to expand vertically
                decoration: InputDecoration(
                  border: InputBorder.none, // Remove the default border
                  hintText: 'Write your blog content here...',
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 150.0), // Padding inside the text field
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
