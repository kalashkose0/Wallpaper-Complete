class PhotoModels {
  String? url;
  SrcModels? src;

  PhotoModels({ this.url,  this.src});

  factory PhotoModels.fromMap(Map<String, dynamic> parsedJson) {
    return PhotoModels(
        url: parsedJson["url"], src: SrcModels.fromMap(parsedJson["src"]));
  }
}

class SrcModels {
  String? portrait;
  String? large;
  String? landscape;
  String? medium;

  SrcModels(
      {required this.landscape,
      required this.large,
      required this.medium,
      required this.portrait});

  factory SrcModels.fromMap(Map<String, dynamic> srcJson) {
    return SrcModels(
        portrait: srcJson["portrait"],
        large: srcJson["large"],
        landscape: srcJson["landscape"],
        medium: srcJson["medium"]);
  }
}
