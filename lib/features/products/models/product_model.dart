class ProductModel {
  String image;
  String title;
  num price;
  num rate;

  ProductModel(
      {required this.image,
      required this.title,
      required this.price,
      required this.rate});

  factory ProductModel.formdata(Map<String, dynamic> json) {
    return ProductModel(
        image: json['thumbnail'],
        title: json['title'],
        price: json['price'],
        rate: json['rating']);
  }
}
