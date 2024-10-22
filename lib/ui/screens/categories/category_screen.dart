import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_task/api_services/ApiService.dart';
import 'package:ecommerce_task/cubits/internet_cubit.dart';
import 'package:ecommerce_task/cubits/internet_state.dart';
import 'package:ecommerce_task/routes/RouteApp.dart';
import 'package:ecommerce_task/ui/screens/categories/cubit/category_cubit.dart';
import 'package:ecommerce_task/ui/screens/categories/cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/AppString.dart';
import '../../utils/AppText.dart';
import '../../utils/ColorUtils.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  bool isCallApi = false;

  List<String> categoryList = [];
  String res = "";

  @override
  void initState() {
    super.initState();

    context.read<CategoryCubit>().categoryList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.colorBlack,
        title: AppText.TextAppBar(AppString.categoryTitle),

      ),
      body: BlocBuilder<CategoryCubit,CategoryState>(
        builder: (context,state){

          if(state is CategoryLoadingState){

          }
          if(state is CategoryResponseState){



            categoryList.clear();
            categoryList = state.response;

            // res = state.response.toString();

            debugPrint("category response : ${state.response.length}");

            // debugPrint("CategoryList : ${categoryList.length}");

          }
          if(state is CategoryErrorState){
            debugPrint("CategoryError : ${state.message}");
          }

          return Container(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0
              ),
              itemCount: categoryList.length,
              itemBuilder: (context,index){

                return GestureDetector(
                  onTap: (){

                    Navigator.of(context).pushNamed(productScreenRoute,arguments: {
                      "id":categoryList[index]
                    });

                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: AppText.TextMedium("${categoryList[index]}", 16, ColorUtils.colorBlack),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
