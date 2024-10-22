import 'package:ecommerce_task/ui/utils/AppText.dart';
import 'package:ecommerce_task/ui/utils/ColorUtils.dart';
import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {

  VoidCallback callback;
  String btnText;


  AppButton({Key? key,
    required this.callback,
    required this.btnText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: AppText.TextRegular(btnText, 16, Colors.white),
      style: ElevatedButton.styleFrom(
        primary: ColorUtils.colorBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),

        ),
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15)
      ),
    );
  }
}
