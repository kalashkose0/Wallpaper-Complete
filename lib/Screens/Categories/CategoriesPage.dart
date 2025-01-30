import 'package:flutter/material.dart';
import 'package:wallpaper/Constants/Uihelper.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  //list
  List<Map<String, String>> arrData = [
    // list
    {'text': 'WildLife', 'img': 'assets/images/wild.jpg'},
    {'text': 'Foods', 'img': 'assets/images/food.jpg'},
    {'text': 'Nature', 'img': 'assets/images/nature.jpg'},
    {'text': 'City', 'img': 'assets/images/city.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Uihelper.CustomText(
            text: "Categories",
            color: Colors.black,
            fontweight: FontWeight.bold,
            fontsize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: arrData.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      item['img']!,
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Uihelper.CustomText(
                        text: item['text']!,
                        color: Colors.white,
                        fontweight: FontWeight.bold,
                        fontsize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
