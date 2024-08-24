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
  State<CategoryPage> createState() => _CategoryPageState();
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:  Text('Select Category',style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Please select a category:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(height: 20.0), // Space between title and list
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero, // Remove default padding
                children: <Widget>[
                  _buildCategoryRadio('Personal '),
                  _buildCategoryRadio('Lifestyle '),
                  _buildCategoryRadio('Travel '),
                  _buildCategoryRadio('Food '),
                  _buildCategoryRadio('Fashion '),
                  _buildCategoryRadio('Beauty '),
                  _buildCategoryRadio('Health and Wellness '),
                  _buildCategoryRadio('Parenting '),
                  _buildCategoryRadio('Educational '),
                  _buildCategoryRadio('Technology '),
                  _buildCategoryRadio('Business '),
                  _buildCategoryRadio('Finance '),
                  _buildCategoryRadio('DIY and Craft '),
                  _buildCategoryRadio('Photography '),
                  _buildCategoryRadio('Review '),
                  _buildCategoryRadio('Niche '),
                  _buildCategoryRadio('News and Opinion '),
                  _buildCategoryRadio('Mental Health '),
                  _buildCategoryRadio('Relationship '),
                  _buildCategoryRadio('Environmental '),
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