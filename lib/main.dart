import 'dart:developer';

import 'package:e_commerce/config/cache/cache_constants.dart';
import 'package:e_commerce/config/router/app_router.dart';
import 'package:e_commerce/core/service_locator.dart';
import 'package:e_commerce/features/auth/data/auth_repo.dart';
import 'package:e_commerce/features/auth/views/cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/views/login_view.dart';
import 'package:e_commerce/features/products/views/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await CacheHelper.init();
  // CacheHelper.set(key: CacheConstants.test, value: 'hello');
  // log("Test value is ${CacheHelper.getString(key: CacheConstants.test)}");
  // await CacheHelper.setSecureData(key: 'name', value: 'youssef');

  // String? name = await CacheHelper.getSecureData(key: 'name');
  // log("Secure name is $name");

  // await CacheHelper.init();

  // CacheHelper.setSecureData(key: CacheConstants.langaugeKey, value: 'ar');
  // String? lang =
  //     await CacheHelper.getSecureData(key: CacheConstants.langaugeKey);
  // log("Current lang is $lang");
  // await CacheHelper.set(key: CacheConstants.langaugeKey, value: 'en');
  // log("Current lang is ${CacheHelper.getString(key: CacheConstants.langaugeKey)}");

  setupServiceLocator();
  runApp(Baqallla());
} // debendency injection

class Baqallla extends StatelessWidget {
  const Baqallla({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        onGenerateRoute: AppRouter().onGenerateRoute,
        home: BlocProvider(
          create: (context) => LoginCubit(authRepo: getIt<AuthRepo>()),
          child: LoginView(),
        ),
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