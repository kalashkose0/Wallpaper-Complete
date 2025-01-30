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
  List<PhotoModels> photos = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false; // Loading state

  @override
  void initState() {
    super.initState();
    fetchWallpapers("nature"); 
    // Load default images
  }

  Future<void> fetchWallpapers(String query) async {
    setState(() {
      isLoading = true; // Show loading indicator
      photos.clear(); // Clear old images before fetching new ones
    });

    final response = await http.get(
      Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=20"),
      headers: {
        "Authorization":
            "IZvyKuVQjTeXRWgg75tpAtN3cQf4PntYOGDk50ycfJZw5RS6Dj84QvKm",
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<PhotoModels> newPhotos = jsonData["photos"]
          .map<PhotoModels>((element) => PhotoModels.fromMap(element))
          .toList();

      setState(() {
        photos = newPhotos;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print("Error fetching wallpapers: ${response.statusCode}");
    }
  }

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
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFEFECEC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search wallpapers...",
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (searchController.text.isNotEmpty) {
                        fetchWallpapers(searchController.text);
                      }
                    },
                    child: Icon(Icons.search),
                  ),
                ),
                onSubmitted: (query) {
                  if (query.isNotEmpty) {
                    fetchWallpapers(query);
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : photos.isEmpty
                      ? Center(child: Text("No wallpapers found"))
                      : GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: photos.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: photos[index].src!.medium!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
