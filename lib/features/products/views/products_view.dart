import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/features/products/views/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => ProductsCubit()..fetchAllProducts(),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<ProductsCubit>(context);

            // نجيب المنتجات لو موجوده لكي لا يحصل Error مع Skeletonizer
            final products = state is ProductsSuccess
                ? state.products
                : List.generate(8, (_) => null); // Placeholder for skeleton

            return Skeletonizer(
              enabled: cubit.isLoading,
              child: GridView.builder(
                padding: EdgeInsets.all(12),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisExtent: 230.h,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xfff6f7f9),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: product?.image ?? "",
                          height: 120,
                          placeholder: (context, url) => Container(
                            color: Colors.grey.shade300,
                            height: 120,
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.grey.shade300,
                            height: 120,
                          ),
                        ),
                        SizedBox(height: 25.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product?.title ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "subtitle",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Icon(Icons.star,
                                    color: Colors.amber, size: 20.sp),
                                SizedBox(width: 5.w),
                                Text("${product?.rate ?? ''}",
                                    style: TextStyle(fontSize: 14.sp)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
