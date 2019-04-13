class Product {
  final int id;
  final String title;
  final String body;

  const Product({
    this.id,
    this.title,
    this.body
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

