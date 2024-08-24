import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final addController = TextEditingController();
  List<DocumentSnapshot> searchResults = [];

  @override
  void initState() {
    super.initState();
    addController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    addController.removeListener(_onSearchChanged);
    addController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    searchBlogs(addController.text);
  }

  void searchBlogs(String query) async {
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }

    final results = await FirebaseFirestore.instance
        .collection('Blogs')
        .where('title', isGreaterThanOrEqualTo: query)
        .where('title', isLessThanOrEqualTo: query + '\uf8ff')
        .get();

    setState(() {
      searchResults = results.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search.. ',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: addController,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintStyle:
                    TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                hintText: 'Search Blogs...',
                
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                
                filled: true,
                fillColor: Theme.of(context).colorScheme.primary,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final blog = searchResults[index];
                  return ListTile(
                    title: Text(blog['title']),
                    subtitle: Text(blog['content']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
