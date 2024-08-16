import 'package:blogapp/admin/admin-components/api.dart';
import 'package:flutter/material.dart';
import 'package:blogapp/admin/admin-components/users.dart';

class Manageusers extends StatefulWidget {
  const Manageusers({super.key});

  @override
  _ManageusersState createState() => _ManageusersState();
}

class _ManageusersState extends State<Manageusers> {
  late Future<List<Map<String, dynamic>>> _userFuture;
  final Apiservice _apiservice = Apiservice('https://jsonplaceholder.typicode.com/users');
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredUsers = [];
  List<Map<String, dynamic>> _allUsers = [];

  @override
  void initState() {
    super.initState();
    _userFuture = _apiservice.fetchUsers().then((users) {
      setState(() {
        _allUsers = users;
        _filteredUsers = users;
      });
      return users;
    });
    _searchController.addListener(_filterUsers);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterUsers() { //search function
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredUsers = _allUsers.where((user) {
        final name = user['name']?.toLowerCase() ?? '';
        final email = user['email']?.toLowerCase() ?? '';
        return name.contains(query) || email.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Users',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField( //seach
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search users...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _userFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder( //listitemsbuild
                    itemCount: _filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = _filteredUsers[index];
                      return ListTile( 
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        title: Text( //user
                          user['name'] ?? 'Unknown User',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: (){
                          //naviage to users page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetail(user: user),
                            ),
                          );
                        },
                        subtitle: Text( //email
                          'Email: ${user['email'] ?? 'Unknown Email'}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
