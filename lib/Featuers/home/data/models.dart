class Model {
  final String name;
  final String image;
  final String description;
  final String price;
  final String? id;
  final String? catogerey;

  Model({
    this.id,
    this.catogerey,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}
