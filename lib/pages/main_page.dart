import 'package:cloud_firestore/cloud_firestore.dart';
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
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
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${snapshot.data!.docs[index]["title"]}"),
                    subtitle: Text("${snapshot.data!.docs[index]["content"]}"),
                  );
                },
                );
            }else if(snapshot.hasError){
              return Center(child: Text(snapshot.hasError.toString()),);
            }else{
              return const Center(child: Text('Blogs Not found'),);
            }
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the NewBlogPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>const CreateBlogPage()),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Button color
        foregroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add), // Icon color
      ),
    );
  }
}