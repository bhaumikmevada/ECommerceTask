import 'package:ecommerce_task/routes/RouteApp.dart';
import 'package:ecommerce_task/ui/screens/categories/cubit/category_cubit.dart';
import 'package:ecommerce_task/ui/screens/products/cubit/category_productlist_cubit.dart';
import 'package:ecommerce_task/ui/screens/products/cubit/product_cubit.dart';
import 'package:ecommerce_task/ui/utils/AppString.dart';
import 'package:ecommerce_task/ui/utils/PrefernceUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_services/ApiService.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  PreferenceUtils.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CategoryCubit(ApiService())),
        BlocProvider(create: (_) => ProductCubit(ApiService())),
        BlocProvider(create: (_) => CategoryProductListCubit(ApiService()))
      ],
      child: MaterialApp(
        title: AppString.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: loginScreenRoute,
        onGenerateRoute: RouteApp.generatedRoute,
      ),
    );
  }
}

