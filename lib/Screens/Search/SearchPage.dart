import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/Constants/Uihelper.dart';
import 'package:wallpaper/models/PhotoModels.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
// list

  List<PhotoModels> photos = [];
  TextEditingController SearchController = TextEditingController();

  getSearchWallpaper(String searchQuery) async {
    final response = await http.get(
      Uri.parse(
          "https://api.pexels.com/v1/search?query=$searchQuery&per_page=1"),
      headers: {
        "Authorization":
            "IZvyKuVQjTeXRWgg75tpAtN3cQf4PntYOGDk50ycfJZw5RS6Dj84QvKm"
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      jsonData["photos"].forEach((element) {
        // Use the factory constructor directly
        PhotoModels photoModels = PhotoModels.fromMap(element);
        photos.add(photoModels);
      });
      setState(() {}); // Refresh UI after adding photos
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  @override
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
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: SearchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {}); //Trigger FutureBuilder to rebuild
                    },
                    child: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: getSearchWallpaper(SearchController.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData || photos.isEmpty) {
                    return Center(
                      child: Text("No wallpapers found"),
                    );
                  } else {
                    // Display the list of photos
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: photos.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          // child: CachedNetworkImage(imageUrl:)
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
