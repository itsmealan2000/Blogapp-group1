import 'package:blogapp/pages/liked_page.dart';
import 'package:blogapp/pages/main_page.dart';
import 'package:blogapp/pages/search_page.dart';
import 'package:blogapp/pages/setting_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List pages=[
     MainPage(),
    const SearchPage(),
    const LikedPage(),
    const SettingPage()
  ];
  
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary
        ),
        // selectedLabelStyle: TextStyle(
        //   color: Theme.of(context).colorScheme.inversePrimary,
        //   fontWeight: FontWeight.bold
        // ),
        elevation: 5,
        selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        showSelectedLabels: true,
        currentIndex: _currentIndex,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
        ),
        body: pages[_currentIndex],
    );
  }
}