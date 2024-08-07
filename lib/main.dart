import 'package:flutter/material.dart';
import 'createBlog.dart'; // Import the new page

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(), // Use a separate widget for the main page
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple[100], // Purple background for the entire screen
        child: Column(
          children: [
            Container(
              color: Colors.pink[100], // Pink background for the heading
              child: const Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 50.0), // Adjust padding as needed
                    child: Text(
                      'DoYourBlog',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman', // Set the font family
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black, // Line color
                    thickness: 2, // Line thickness
                    indent: 20, // Left indent
                    endIndent: 20, // Right indent
                  ),
                ],
              ),
            ),
            // Separate Container for the search box
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: const SizedBox(
                height: 40.0, // Set the height of the search box
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(30.0)), // Oval shape
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal:
                            15.0), // Adjust the padding to control the height
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            const Spacer(), // To push the Center widget to the middle of the screen
            const Center(
              child: Text('Kamala!'),
            ),
            const Spacer(), // To push the Center widget to the middle of the screen
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the NewBlogPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewBlogPage()),
          );
        },
        backgroundColor: Color.fromARGB(255, 190, 10, 70), // Button color
        foregroundColor: Colors.white,
        child: const Icon(Icons.add), // Icon color
      ),
    );
  }
}
