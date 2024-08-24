import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'createBlog.dart'; // Import the new page

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  // List blog = [];
  // void onSaved() {}

  // Function to delete a blog by its document ID
  Future<void> deleteBlog(String docId) async {
    await FirebaseFirestore.instance.collection("Blogs").doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text(
          'DoYourBlog',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman', // Set the font family
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Blogs").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var blog = snapshot.data!.docs[index];
                  return Container(
                    margin: const EdgeInsets.only(top: 7, left: 5, right: 5),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Text("${blog["title"]}"),
                      subtitle: Text("${blog["content"]}"),
                      // Add a delete button to the right (trailing) side
                      trailing: IconButton(
                        icon:  Icon(Icons.delete, color:Theme.of(context).colorScheme.inversePrimary),
                        onPressed: () {
                          // Confirm before deleting
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Delete Blog"),
                              content: const Text(
                                  "Are you sure you want to delete this blog?"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Cancel",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Delete the blog from Firestore
                                    deleteBlog(blog.id);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Delete",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.hasError.toString()));
            } else {
              return const Center(child: Text('Blogs Not found'));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the NewBlogPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateBlogPage()),
          );
        },
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary, // Button color
        foregroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add), // Icon color
      ),
    );
  }
}