import 'package:blogapp/components/my_textfield.dart';
// import 'package:blogapp/pages/home_page.dart';
// import 'package:blogapp/pages/liked_page.dart';
// import 'package:blogapp/pages/setting_page.dart';
import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

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
      // bottomNavigationBar: Container(
      //   color: Theme.of(context).colorScheme.primary,
      //   child: GNav(
      //     backgroundColor: Theme.of(context).colorScheme.secondary,
      //     color: Theme.of(context).colorScheme.inversePrimary,
      //     activeColor: Theme.of(context).colorScheme.primary,
      //     tabBackgroundColor: Theme.of(context).colorScheme.secondary,
      //     gap: 8,
      //     padding: const EdgeInsets.all(15),
      //     tabs:  [
      //       GButton(icon: Icons.home,text: 'Home',onPressed: (){
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
      //       },),
      //       GButton(icon: Icons.favorite_border,text: 'Favorite',onPressed: (){
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => const LikedPage(),));
      //       },),
      //       GButton(icon: Icons.search,text: 'Search',onPressed: (){
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage(),));
      //       },),
      //       GButton(icon: Icons.settings,text: 'Settings',onPressed: (){
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingPage(),));
      //       },),
      //     ]
      //     ),
      // ),
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