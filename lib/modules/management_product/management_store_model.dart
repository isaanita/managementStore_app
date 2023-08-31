class ManagementStoreModel {
  int id;
  String? title;
  String? description;
  int? price;
  int? stock;

  // Constructor
  ManagementStoreModel(
      {required this.id, this.title, this.description, this.price, this.stock});

  // Merubah json ke format model product
  factory ManagementStoreModel.fromJsonn(Map<dynamic, dynamic> json) =>
      ManagementStoreModel(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          price: json['price'],
          stock: json['stock']);
}
