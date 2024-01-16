class PackagesModel {
  final String title;
  final String subtitle;
  final String price;
  final String id;

  PackagesModel(
      {required this.title,
      required this.subtitle,
      required this.price,
      required this.id});

  factory PackagesModel.fromJson(jsonData) {
    return PackagesModel(
        title: jsonData['title'],
        subtitle: jsonData['subtitle'],
        price: jsonData['price'],
        id: jsonData['id']);
  }
}
