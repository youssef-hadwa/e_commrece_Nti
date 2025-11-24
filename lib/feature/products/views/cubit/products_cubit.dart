import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/feature/products/data/products_repo.dart';
import 'package:e_commerce/feature/products/data/products_web_service.dart';
import 'package:e_commerce/feature/products/models/product_model.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  // Dio dio =Dio();
  ProductsRepo productsRepo =
      ProductsRepo(productsWebService: ProductsWebService(dio: Dio()));

  ProductsCubit() : super(ProductsInitial());

  fetchAllProducts() async {
    emit(ProductsLoading());
    try {
      List<ProductModel> products = await productsRepo.getAllProducts();

      /// sucess
      emit(ProductsSuccess(products: products));
    } on Exception catch (e) {
      emit(ProductsFailure(errorMessage: e.toString()));
    }
  }
}
