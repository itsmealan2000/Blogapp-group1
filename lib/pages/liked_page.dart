// import 'package:blogapp/pages/home_page.dart';
// import 'package:blogapp/pages/search_page.dart';
// import 'package:blogapp/pages/setting_page.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';


class LikedPage extends StatelessWidget {
  const LikedPage({super.key});

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
      body: const Center(child: Text("Liked Page")),
    );
  }
}