import 'package:flutter/material.dart';

class TextFieldUtils extends StatefulWidget {

  TextEditingController controller;
  Color fillColor = Colors.white;
  TextInputAction textInputAction;
  TextInputType textInputType;
  bool isPassword = false;
  String hintText;
  Function(String) onValidator;


   TextFieldUtils({
    Key? key,
    required this.controller,
     this.fillColor = Colors.white,
     required this.textInputAction,
     required this.textInputType,
     required this.hintText,
     this.isPassword = false,
     required this.onValidator
  }) : super(key: key);

  @override
  State<TextFieldUtils> createState() => _TextFieldUtilsState();
}

class _TextFieldUtilsState extends State<TextFieldUtils> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            fillColor: widget.fillColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey,fontSize: 14)
        ),
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        obscureText: widget.isPassword ? true : false,
        validator: (value) => widget.onValidator(value!),

      ),
    );
  }
}
