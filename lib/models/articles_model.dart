class ArticlesModel {
  final String title;
  final String subtitle;
  final String dec;
  final String image;
  final String id;

  ArticlesModel(
      {required this.title,
      required this.subtitle,
      required this.dec,
      required this.image,
      required this.id});

  factory ArticlesModel.fromJson(jsonData) {
    return ArticlesModel(
        title: jsonData['title'],
        subtitle: jsonData['subtitle'],
        dec: jsonData['dec'],
        image: jsonData['image'],
        id: jsonData['id']);
  }
}
