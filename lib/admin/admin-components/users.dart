import 'package:flutter/material.dart';

//fulldetails of user
class UserDetail extends StatelessWidget {
  final Map<String, dynamic> user;
  const UserDetail({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user['name'],
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user['name']}',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'Email: ${user['email']}',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'Phone: ${user['phone']}',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'Website: ${user['website']}',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            //delete
            ElevatedButton(
              onPressed: () {
                //delete user
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text(
                'Delete User',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                  )
                ),
            ),
          ],
        ),
      ),
    );
  }
}
