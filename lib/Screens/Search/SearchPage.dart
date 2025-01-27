import 'package:flutter/material.dart';
import 'package:wallpaper/Constants/Uihelper.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Center(
            child: Uihelper.CustomText(
              text: "Search",
              color: Colors.black,
              fontweight: FontWeight.bold,
              fontsize: 28,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 239, 236, 236),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, suffixIcon: Icon(Icons.search)),
            ),
          )
        ],
      )),
    );
  }
}
