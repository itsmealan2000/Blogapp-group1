import 'package:blogapp/components/my_listtile.dart';
import 'package:flutter/material.dart';
import 'createBlog.dart'; // Import the new page

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
 MainPage({super.key});

List blog=[];
  void onSaved(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0), // Adjust padding as needed
                  child: Text(
                    'DoYourBlog',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman', // Set the font family
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black, // Line color
                  thickness: 2, // Line thickness
                  indent: 20, // Left indent
                  endIndent: 20, // Right indent
                ),
                // ListView.builder(
                //   itemCount: blog.length,
                //   itemBuilder: (context, index) {
                //     return MyListtile();
                //   },
                //   )
                MyListtile()
                
              ],
            ),
            
            const Spacer(), // To push the Center widget to the middle of the screen
            // const Center(
            //   child: Text("Create your new Blog!!"),
            // ),
            const Spacer(), // To push the Center widget to the middle of the screen
            //  ListView.builder(itemBuilder: (context, index) {
            //       return MyListtile();
            //     },)
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the NewBlogPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewBlogPage(onTap: onSaved,)),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Button color
        foregroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add), // Icon color
      ),
    );
  }
}