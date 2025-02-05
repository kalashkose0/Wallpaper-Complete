import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethoda {
  Future AddWallpaper(
      Map<String, dynamic> wallpaperInfoMap, String id, String category) async {
    return await FirebaseFirestore.instance
        .collection(category)
        .doc(id)
        .set(wallpaperInfoMap);
  }
}
