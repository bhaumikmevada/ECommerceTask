import 'package:ecommerce_task/ui/screens/products/cubit/category_productlist_cubit.dart';
import 'package:ecommerce_task/ui/screens/products/cubit/category_productlist_state.dart';
import 'package:ecommerce_task/ui/screens/products/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes/RouteApp.dart';
import '../../utils/AppString.dart';
import '../../utils/AppText.dart';
import '../../utils/ColorUtils.dart';
import '../../utils/ConstantsUtils.dart';
import '../../utils/PrefernceUtils.dart';
import 'cubit/product_cubit.dart';
import 'model/CategoryProductModel.dart';
import 'model/ProductModel.dart';

class CategoryProductScreen extends StatefulWidget {

  CategoryProductScreen({Key? key}) : super(key: key);

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {

  List<CategoryProductModel> list = [];


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    context.read<CategoryProductListCubit>().categoryProductList(PreferenceUtils.getString(ConstantsUtils.CAT_NAME));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorUtils.colorBlack,
          title: AppText.TextAppBar(AppString.productListTitle),

        ),
      body: BlocBuilder<CategoryProductListCubit,CategoryProductListState>(
        builder: (context,state){

          if(state is CategoryProductListLoadingState){

          }
          else if(state is CategoryProductListResponseState){

            list.clear();
            list.addAll(state.model);

            debugPrint("category product response state : ${list.length}");


          }
          else if(state is CategoryProductListErrorState){
            debugPrint("product category error state : ${state.message}");
          }
          return  Container(
            margin: EdgeInsets.all(20),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8
              ),
              itemCount: list.length,
              itemBuilder: (context,index){

                return GestureDetector(
                  onTap: (){

                    PreferenceUtils.setString(ConstantsUtils.PRODUCT_ID, "${list[index].id}");
                    Navigator.of(context).pushNamed(productScreenRoute);

                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [

                          Image.network("${list[index].image}",
                         height: 100,width:MediaQuery.of(context).size.width,fit: BoxFit.cover,),

                          const SizedBox(height: 10,),

                          Center(
                            child: AppText.TextRegular("${list[index].title}", 12, ColorUtils.colorBlack),
                          ),

                          const SizedBox(height: 10,),

                        ],
                      )
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
