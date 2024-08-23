import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blogapp/admin/admin-components/Editblogs.dart'; 

class ManageBlogs extends StatefulWidget {
  const ManageBlogs({super.key});

  @override
  State<ManageBlogs> createState() => _ManageBlogsState();
}

class _ManageBlogsState extends State<ManageBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Blogs',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 100,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Blogs").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              var blogDocs = snapshot.data!.docs;
              if (blogDocs.isEmpty) {
                return const Center(
                  child: Text("No blogs available"),
                );
              }

              return ListView.builder(
                itemCount: blogDocs.length,
                itemBuilder: (context, index) {
                  var blog = blogDocs[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                      backgroundColor: Colors.red,
                    ),
                    title: Text("${blog['title']}"),
                    titleTextStyle: 
                      const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    subtitle: Text("${blog['content']}"),
                    subtitleTextStyle: 
                      const TextStyle(
                        fontSize: 20,
                      ),
                    onTap: () {//to editor screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditBlogs(
                          docId: blog.id,//pasingid
                          currentTitle: blog['title'],//passingtitle
                          currentContent: blog['content'],//passingcontext
                        ),
                      ));
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else {
              return const Center(
                child: Text("No data found"),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
