import 'package:dio/dio.dart';
import 'package:e_commerce/feature/products/data/products_web_service.dart';
import 'package:e_commerce/feature/products/models/product_model.dart';

class ProductsRepo {
  final ProductsWebService productsWebService;
  late List<ProductModel> products = [];

  ProductsRepo({required this.productsWebService});

  Future<List<ProductModel>> getAllProducts() async {
    Response response = await productsWebService.getAllProductsResponse();

    /// get it resonse
    for (var product in response.data['products']) {
      products.add(ProductModel.formdata(product));
    }
    return products;
  }
}
// try  , catch