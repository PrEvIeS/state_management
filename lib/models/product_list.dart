class ProductListModel {
  int limit;

  List<Product> products;

  int total;

  int skip;

  ProductListModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
        products: List<Product>.from(
          json["products"].map((x) => Product.fromJson(x)),
        ),
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
      );
  }

  Map<String, dynamic> toJson() => {
    'products': products,
    'total': total,
    'skip': skip,
    'limit': limit,
  };

  @override
  String toString() {
    return toJson().toString();
  }
}

class Product {
  String title;

  String description;

  int price;

  List<String> images;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json['title'],
        description: json['description'],
        price: json['price'],
        images: List<String>.from(
          json["images"].map((x) => x.toString()),
        ),
      );

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'price': price,
    'images': images,
  };

  @override
  String toString() {
    return toJson().toString();
  }
}
