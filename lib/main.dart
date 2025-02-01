import 'package:flutter/material.dart';
import 'package:wallpaper/Admin/AdminLogIn.dart';
import 'package:wallpaper/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:wallpaper/Screens/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // home: HomePage(),
      // home: BottomNavigationScreen(),
      home: AdminLogin(),
    );
  }
}
