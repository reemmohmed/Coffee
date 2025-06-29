class ProductModel {
  String? id;
  DateTime? createdAt;
  String? titele;
  String? descrabtion;
  String? image;
  int? price;
  String? catogerys;
  String? subtitel;

  ProductModel({
    this.id,
    this.createdAt,
    this.titele,
    this.descrabtion,
    this.image,
    this.price,
    this.catogerys,
    this.subtitel,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    titele: json['titele'] as String?,
    descrabtion: json['descrabtion'] as String?,
    image: json['image'] as String?,
    price: json['price'] as int?,
    catogerys: json['catogerys'] as String?,
    subtitel: json['subtitel'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt?.toIso8601String(),
    'titele': titele,
    'descrabtion': descrabtion,
    'image': image,
    'price': price,
    'catogerys': catogerys,
    'subtitel': subtitel,
  };
}
