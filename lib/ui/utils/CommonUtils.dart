
import 'package:ecommerce_task/ui/utils/AppString.dart';
import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonUtils{

  static void showSuccessDialog(BuildContext context,String desc,){

    edgeAlert(
      context,
      title: AppString.appName,
      description: desc,
      gravity: Gravity.top,
      backgroundColor: Colors.green
    );

  }
}