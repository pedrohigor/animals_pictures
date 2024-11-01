class AppPicture {
  late String url;
  late int width;
  late int height;
  late int id;
  late bool liked;

  AppPicture(
      {required this.liked,
      required this.url,
      required this.height,
      required this.id,
      required this.width});

  AppPicture.fromJson(Map json) {
    url = json["url"];
    width = json["width"];
    height = json["height"];
    liked = false;
  }
}
