import 'package:e_commerce/core/service_locator.dart';
import 'package:e_commerce/features/auth/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  setupServiceLocator();
  runApp(Baqallla());
} // debendency injection

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
        home: LoginView(),
      ),
    );
  }
}

// class Car {
//   Engine engine;

//   // set setEngine(Engine engine) {
//   //   this.engine = engine;
//   // }

//   Car({required this.engine});
// }

// class Engine {}


// DEBENDENCY INJECTION  

// loose coubling is when a group of classes are not dependent on one another.




//tight coubling  is when a group of classes are highly dependent on one another.


// 1 -by passing instance from constructor
// 2- by setter method


// 3- by service locator (get it package)