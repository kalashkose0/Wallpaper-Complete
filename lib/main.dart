import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/Admin/AdminLogIn.dart';
import 'package:wallpaper/Admin/AddWallpaper.dart';
import 'package:wallpaper/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:wallpaper/Screens/homePage.dart';

void main() async {
  // Ensures Flutter bindings are initialized before calling Firebase.initializeApp
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  try {
    await Firebase.initializeApp();
    runApp(const MyApp());
  } catch (e) {
    print("Error initializing Firebase: $e");
    runApp(const MyApp());
    // You can also show an error screen here
  }
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
      // home: AdminLogin(),
      home: AddWallpaper(),
    );
  }
}
