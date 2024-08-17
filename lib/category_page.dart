import 'package:flutter/material.dart';
import 'preview_page.dart';

class CategoryPage extends StatefulWidget {
  final String title;
  final String content;

  const CategoryPage({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String? _selectedCategory;

  void _navigateToPreview({required bool skip}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewPage(
          title: widget.title,
          content: widget.content,
          category: skip ? null : _selectedCategory,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please select a category:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0), // Space between title and list
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero, // Remove default padding
                children: <Widget>[
                  _buildCategoryRadio('Personal Blogs'),
                  _buildCategoryRadio('Lifestyle Blogs'),
                  _buildCategoryRadio('Travel Blogs'),
                  _buildCategoryRadio('Food Blogs'),
                  _buildCategoryRadio('Fashion Blogs'),
                  _buildCategoryRadio('Beauty Blogs'),
                  _buildCategoryRadio('Health and Wellness Blogs'),
                  _buildCategoryRadio('Parenting Blogs'),
                  _buildCategoryRadio('Educational Blogs'),
                  _buildCategoryRadio('Technology Blogs'),
                  _buildCategoryRadio('Business Blogs'),
                  _buildCategoryRadio('Finance Blogs'),
                  _buildCategoryRadio('DIY and Craft Blogs'),
                  _buildCategoryRadio('Photography Blogs'),
                  _buildCategoryRadio('Review Blogs'),
                  _buildCategoryRadio('Niche Blogs'),
                  _buildCategoryRadio('News and Opinion Blogs'),
                  _buildCategoryRadio('Mental Health Blogs'),
                  _buildCategoryRadio('Relationship Blogs'),
                  _buildCategoryRadio('Environmental Blogs'),
                ],
              ),
            ),
            const SizedBox(height: 20.0), // Space between list and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => _navigateToPreview(skip: true),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey, // White text color
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Skip'),
                  ),
                ),
                const SizedBox(width: 10.0), // Space between buttons
                Expanded(
                  child: TextButton(
                    onPressed: () => _navigateToPreview(skip: false),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black, // White text color
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryRadio(String category) {
    return ListTile(
      title: Text(category),
      leading: Radio<String>(
        value: category,
        groupValue: _selectedCategory,
        onChanged: (String? value) {
          setState(() {
            _selectedCategory = value;
          });
        },
      ),
    );
  }
}
