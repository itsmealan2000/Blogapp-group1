import 'package:blogapp/admin/admin_page.dart';
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
    const MainPage(),
    const SearchPage(),
    const AdminPage(),
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
   
        elevation: 5,
        selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        showSelectedLabels: true,
        currentIndex: _currentIndex,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings),label: 'Admin'),
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