import 'package:blogapp/components/my_textfield.dart';
import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: MyTextfield(
          controller: searchController,
          icon: const Icon(Icons.search),
          obscure: false,
          text: 'Search Here',  
        ),
      ),
    );
  }
}