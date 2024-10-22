import 'package:ecommerce_task/api_services/ApiService.dart';
import 'package:ecommerce_task/routes/RouteApp.dart';
import 'package:ecommerce_task/ui/screens/login/cubit/login_state.dart';
import 'package:ecommerce_task/ui/utils/AppButton.dart';
import 'package:ecommerce_task/ui/utils/AppString.dart';
import 'package:ecommerce_task/ui/utils/ColorUtils.dart';
import 'package:ecommerce_task/ui/utils/CommonUtils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/AppText.dart';
import '../../utils/TextFieldUtils.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final usernameController = TextEditingController();
  final passController = TextEditingController();
  final formKey  = GlobalKey<FormState>();

  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) =>  LoginCubit(ApiService()))
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorUtils.colorBlack,
          title: AppText.TextAppBar(AppString.loginTitle),

        ),

        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              AppText.TextBold(AppString.loginTitle, 20, ColorUtils.colorBlack),

              const SizedBox(height: 20,),

              Form(
                key: formKey,
                child: Column(
                  children: [


                    TextFieldUtils(
                      controller: usernameController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                      hintText: AppString.usernameHint,
                      onValidator: (value){
                        if(value == null || value.isEmpty){
                          return AppString.userNameValidation;
                        }

                      },
                    ),

                    const SizedBox(height: 20,),

                    TextFieldUtils(
                      controller: passController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                      hintText: AppString.passwordHint,
                      onValidator: (value){

                        if(value == null || value.isEmpty){
                          return AppString.passwordValidation;
                        }

                      },
                    ),

                    const SizedBox(height: 20,),

                   BlocConsumer<LoginCubit,LoginState>(
                     listener: (context,state){

                       if(state is LoginLoadingState){

                       }
                       else if(state is LoginResponseState){

                         CommonUtils.showSuccessDialog(context, "Login Success");

                         debugPrint("login success state : ${state.model.token}");


                         Navigator.of(context).pushNamed(categoryScreenRoute);

                       }
                       else if(state is LoginErrorState){
                         debugPrint("Login Error : ${state.message}");
                       }

                     },
                     builder: (context,state){

                       return  SizedBox(
                         width: MediaQuery.of(context).size.width,
                         height: 50,
                         child: AppButton(
                           btnText: AppString.loginBtnText,
                           callback: (){

                             if(formKey.currentState!.validate()){

                               setState(() {

                                 context.read<LoginCubit>().login(usernameController.value.text.toString(),
                                 passController.value.text.toString());


                               });
                             }
                           },
                         ),
                       );
                     },
                   )


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
