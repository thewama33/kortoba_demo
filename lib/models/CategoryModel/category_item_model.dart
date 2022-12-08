class CategoryItemModel {
  int? id;
  String? name;
  String? imageLink;
  String? price;
  String? description;
  String? rate;
  Category? category;

  CategoryItemModel(
      {this.id,
      this.name,
      this.imageLink,
      this.price,
      this.description,
      this.rate,
      this.category});

  CategoryItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['image_link'];
    price = json['price'];
    description = json['description'];
    rate = json['rate'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_link'] = this.imageLink;
    data['price'] = this.price;
    data['description'] = this.description;
    data['rate'] = this.rate;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? imageLink;

  Category({this.id, this.name, this.imageLink});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['image_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_link'] = this.imageLink;
    return data;
  }
}