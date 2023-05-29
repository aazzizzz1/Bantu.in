class ProductPointModel {
  final List<DetailProductPointModel> product;

  ProductPointModel({required this.product});

  factory ProductPointModel.fromJson(Map<String, dynamic> json) =>
      ProductPointModel(
        product: json['data'] != null
            ? (json['data'] as List)
                .map((e) => DetailProductPointModel.fromJson(e))
                .toList()
            : [],
      );
}

class DetailProductPointModel {
  final int id;
  final String name;
  final String reward;
  final String terms;
  final int price;
  final String photoProduct;
  final String status;
  final int notesQuantity;

  DetailProductPointModel({
    required this.id,
    required this.name,
    required this.reward,
    required this.terms,
    required this.price,
    required this.photoProduct,
    required this.status,
    required this.notesQuantity,
  });

  factory DetailProductPointModel.fromJson(Map<String, dynamic> json) =>
      DetailProductPointModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? 'null',
        reward: json['reward'] ?? 'null',
        terms: json['terms'] ?? 'null',
        price: json['price'] ?? 0,
        photoProduct: json['photo_product'] ?? 'null',
        status: json['status'] ?? 'null',
        notesQuantity: json['notes_quantity'] ?? 0,
      );

  /* "id": 1,
            "name": "Berkah Ramadhan",
            "reward": "10 catatan",
            "terms": "S&K berlaku",
            "price": 100,
            "photo_product": null,
            "status": null,
            "notes_quantity": 0 */
}
