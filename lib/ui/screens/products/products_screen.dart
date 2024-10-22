import 'package:ecommerce_task/ui/screens/products/cubit/product_state.dart';
import 'package:ecommerce_task/ui/utils/ConstantsUtils.dart';
import 'package:ecommerce_task/ui/utils/PrefernceUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/AppString.dart';
import '../../utils/AppText.dart';
import '../../utils/ColorUtils.dart';
import 'cubit/product_cubit.dart';
import 'model/ProductModel.dart';

class ProductsScreen extends StatefulWidget {
  dynamic? params;

   ProductsScreen({Key? key,this.params}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  ProductModel? model;

  @override
  void initState() {
    super.initState();

    debugPrint("product id : ${PreferenceUtils.getString(ConstantsUtils.PRODUCT_ID)}");

  }

  @override
  Widget build(BuildContext context) {
    context.read<ProductCubit>().productCategoryWise(PreferenceUtils.getString(ConstantsUtils.PRODUCT_ID));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorUtils.colorBlack,
          title: AppText.TextAppBar(AppString.productDetailTitle),

        ),
      body: BlocBuilder<ProductCubit,ProductState>(
        builder: (context,state){

          if(state is ProductLoadingState){

          }
          else if(state is ProductResponseState){

            setState(() {
              model = state.model;
            });

            debugPrint("product response state : ${model}");


          }
          else if(state is ProductErrorState){

          }
          return   Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                "${model?.image}" != "" ?
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "${model?.image}",
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  )
                 : Container(),

                  const SizedBox(height: 10,),

                  AppText.TextBold("${model?.title}", 16, ColorUtils.colorBlack),

                const SizedBox(height: 10,),

                AppText.TextRegular("${model?.description}", 14, ColorUtils.colorBlack),

                const SizedBox(height: 10,),

                Container(
                  alignment: Alignment.topLeft,
                  child: AppText.TextBold("Category : ${model?.category}", 16, ColorUtils.colorBlack),
                ),

                const SizedBox(height: 10,),

                Container(
                  alignment: Alignment.topLeft,
                  child: AppText.TextBold("Price : ${model?.price}", 16, ColorUtils.colorBlack),
                )


              ],
            ),
          );
        },
      ),
    );
  }
}
