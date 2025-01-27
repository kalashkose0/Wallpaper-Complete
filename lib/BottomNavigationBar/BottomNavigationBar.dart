import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/Screens/Categories/CategoriesPage.dart';
import 'package:wallpaper/Screens/Search/SearchPage.dart';
import 'package:wallpaper/Screens/homePage.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int currentIndex = 0;

  // Pages for each tab
  List<Widget> pages = [
    HomePage(), // For Home tab
    SearchPage(),
    CategoriesPage(), // For Favorites tab
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: "Settings",
          // ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: const Color.fromARGB(255, 239, 236, 236),
      ),
    );
  }
}
