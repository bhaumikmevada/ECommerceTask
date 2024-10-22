
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_task/ui/screens/products/model/CategoryProductModel.dart';
import 'package:ecommerce_task/ui/utils/ConstantsUtils.dart';
import 'package:flutter/widgets.dart';

import '../ui/screens/login/model/LoginModel.dart';
import '../ui/screens/products/model/ProductModel.dart';

class ApiService{

  Dio dio = Dio(
    BaseOptions(
      baseUrl: ConstantsUtils.BASE_URL,
      connectTimeout: Duration(seconds: 60000),
      responseType: ResponseType.json
    )
  );
  
  Future<LoginModel?> login(String username,String password) async {
    
    var response = await dio.post(ConstantsUtils.loginUrl,data: {
      "username":username,
      "password":password
    });

    debugPrint("login Response : ${response}");

    LoginModel model = LoginModel.fromJson(response.data);

    return model;
  }

  Future<List<String>> categories() async {

    Response response = await dio.get(ConstantsUtils.categoryUrl);

    List<String> list = List<String>.from(response.data);
    debugPrint("category Response api : ${list}");

    return list;
  }

  Future<List<CategoryProductModel>?> categoryProductList(String category) async {

    var response = await dio.get("${ConstantsUtils.productCategoryUrl}/$category");

    debugPrint("CategoryProductList Response api : ${response}");

    List<dynamic> data = response.data;

    List<CategoryProductModel> model = data.map((e) => CategoryProductModel.fromJson(e)).toList();

    return model;
  }


  Future<ProductModel> productCategoryWise(String id) async {

    var response = await dio.get("${ConstantsUtils.productUrl}/$id");

    debugPrint("product Response api : ${response.data}");

    ProductModel model = ProductModel.fromJson(response.data);

    return model;
  }



}