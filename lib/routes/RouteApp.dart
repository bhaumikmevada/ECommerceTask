
import 'package:ecommerce_task/ui/screens/categories/category_screen.dart';
import 'package:ecommerce_task/ui/screens/login/login_screen.dart';
import 'package:ecommerce_task/ui/screens/products/category_products_screen.dart';
import 'package:ecommerce_task/ui/screens/products/products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String loginScreenRoute = '/loginScreenRoute';
const String categoryScreenRoute = '/categoryScreenRoute';
const String categoryProductScreenRoute = '/categoryProductScreenRoute';
const String productScreenRoute = '/productScreenRoute';

class RouteApp{

  static Route<dynamic> generatedRoute(RouteSettings setting){

    switch(setting.name){

      case loginScreenRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case categoryScreenRoute:
        return MaterialPageRoute(builder: (_) => CategoryScreen());
      case categoryProductScreenRoute:
        return MaterialPageRoute(builder: (_) => CategoryProductScreen());
      case productScreenRoute:
        return MaterialPageRoute(builder: (_) => ProductsScreen());

      default:
        return MaterialPageRoute(builder: (_)=> Container(
          child: Center(
            child: Text("No Route Found"),
          ),
        ));
    }
  }
}