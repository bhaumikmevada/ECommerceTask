
import 'package:ecommerce_task/ui/utils/ColorUtils.dart';
import 'package:flutter/material.dart';

class AppText{

  static Widget TextRegular(String message,double fontSize,Color textColor){
    return Text(message,style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w400,color: textColor,
    ),maxLines: 1,);
  }

  static Widget TextMedium(String message,double fontSize,Color textColor){
    return Text(message,style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w500,color: textColor),);
  }

  static Widget TextBold(String message,double fontSize,Color textColor){
    return Text(message,style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w600,color: textColor),);
  }

  static Widget TextAppBar(String message){
    return Text(message,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: ColorUtils.colorWhite),);
  }
}