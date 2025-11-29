import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/networking/api_error_handler.dart';
import 'package:e_commerce/core/service_locator.dart';
import 'package:e_commerce/feature/products/data/products_repo.dart';
import 'package:e_commerce/feature/products/data/products_web_service.dart';
import 'package:e_commerce/feature/products/models/product_model.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  bool isLoading = false;
  // Dio dio =Dio();
  ProductsRepo productsRepo =
      // ProductsRepo(productsWebService: ProductsWebService(dio: Dio()));

      ProductsRepo(productsWebService: getIt<ProductsWebService>());

  ProductsCubit() : super(ProductsInitial());

  fetchAllProducts() async {
    isLoading = true;
    emit(ProductsLoading());
    try {
      List<ProductModel> products = await productsRepo.getAllProducts();

      /// sucess
      emit(ProductsSuccess(products: products));
      isLoading = false;
    } on DioException catch (e) {
      isLoading = false;
      emit(ProductsFailure(errorMessage: ApiErrorHandler.handle(e)));
    }
  }
}
