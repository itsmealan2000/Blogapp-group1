import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
      ),
      body:  Padding(
        padding:const EdgeInsets.all(20.0),
        child: TextField(
          //style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          decoration:  InputDecoration(
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            hintText: 'Search...',
            border:const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.primary,
            contentPadding:
               const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            prefixIcon: Icon(Icons.search,color: Theme.of(context).colorScheme.inversePrimary,),
          ),
        ),
      ),
    );
  }
}