import 'package:dio/dio.dart';
import 'package:e_commerce/feature/products/data/products_repo.dart';
import 'package:e_commerce/feature/products/data/products_web_service.dart';
import 'package:e_commerce/feature/products/models/product_model.dart';
import 'package:e_commerce/feature/products/views/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsView extends StatelessWidget {
  ProductsRepo productsRepo =
      ProductsRepo(productsWebService: ProductsWebService(dio: Dio()));
  ProductsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<ProductsCubit>(
      create: (context) => ProductsCubit()..fetchAllProducts(),
      child:
          BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
        if (state is ProductsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsSuccess) {
          return GridView.builder(
            itemCount: state.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisExtent: 230.h,
            ),
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(0.8),
              // width: 100.w,
              // height: 230.h,
              decoration: BoxDecoration(
                color: Color(0xfff6f7f9),
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
              ),

              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 15.h),
                  Image.network(
                    '${state.products[index].image}',
                    height: 120,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${state.products[index].title}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          )),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.,
                        children: [
                          Text("subtitle",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text("${state.products[index].rate}",
                              style: TextStyle(
                                fontSize: 14.sp,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text(" there is an error"),
          );
        }
      }),
    ));
  }
}
