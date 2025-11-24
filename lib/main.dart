import 'package:e_commerce/feature/products/views/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(Baqallla());
}

class Baqallla extends StatelessWidget {
  const Baqallla({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductsView(),
      ),
    );
  }
}
