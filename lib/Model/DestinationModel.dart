import 'dart:core';

class DestinationModel {
  final String id;
  final String name;
  final String image;
  final List<String> genre;
  final int rating;

  DestinationModel(this.id, this.name, this.image, this.genre, this.rating);

  static List<DestinationModel> MockData() {
    List<DestinationModel> ls = [];
    ls.add(DestinationModel(
      "1",
      "Lang Khai Dinh",
      "assets/images/img1.jpg", [''], 4
    ));
    ls.add(DestinationModel(
        "2",
        "Lang Minh Mang",
        "assets/images/img2.jpg", [''], 4
    ));
    ls.add(DestinationModel(
        "3",
        "Lang Tu Duc",
        "assets/images/img3.jpg", [''], 4
    ));
    return ls;
  }

}