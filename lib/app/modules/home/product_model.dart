class Product {
  String? id;
  String? name;
  String? description;
  String? category;
  int? price;

  Product({this.id, this.name, this.description, this.price, this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    return data;
  }
}
