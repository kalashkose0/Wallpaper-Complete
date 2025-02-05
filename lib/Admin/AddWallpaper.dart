import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddWallpaper extends StatefulWidget {
  const AddWallpaper({super.key});

  @override
  State<AddWallpaper> createState() => _AddWallpaperState();
}

class _AddWallpaperState extends State<AddWallpaper> {
  final List<String> categoryItems = ['WildLife', 'Food', 'Nature', 'City'];
  String? selectedCategory;

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future<void> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  // firebase storage use nhi kiya hai abhi
  // that's why ?

  // -----------------------------------

  // uploadItem() async {
  //   if (selectedImage != null) {
  //     String addId = randomAlphaNumeric(10);
  //     Reference firebaseStorageRef =
  //         FirebaseStorage.instance.ref().child("blogImages").child(addId);

  //     final UploadTask task =
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.deepPurple,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add Wallpaper",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          selectedImage == null
              ? GestureDetector(
                  onTap: getImage,
                  child: Center(
                    child: Material(
                      elevation: 8.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 250,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Material(
                    elevation: 8.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 250,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.file(
                          selectedImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCategory,
                  hint: Text(
                    "Select Category",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  items: categoryItems.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                // Add functionality here
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
