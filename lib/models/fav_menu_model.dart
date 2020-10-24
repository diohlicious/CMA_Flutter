class FavMenuModel {
  final String title;
  final String onTap;
  final String image;

  FavMenuModel({this.title, this.onTap, this.image});

  factory FavMenuModel.fromJson(Map<String, dynamic> json) {
    return FavMenuModel(
      title: json["_title"],
      onTap: json["_onTap"],
      image: json["_image"],
    );
  }
}
