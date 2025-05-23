import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/en.dart';
import 'package:flutter_application_1/loginPage/widgets/common_TextFields.dart';
import 'package:flutter_application_1/loginPage/widgets/login_And_Sign_In_Button.dart';
import 'package:flutter_application_1/loginPage/widgets/watch_List_Eye_Animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
 final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
class LoginAndSignInPage extends StatefulWidget {
   const LoginAndSignInPage({super.key});

  @override
  State<LoginAndSignInPage> createState() => _LoginAndSignInPageState();
}

class _LoginAndSignInPageState extends State<LoginAndSignInPage> {






  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 30.h,),
          WatchListEyeAnimation(),
          CommonTextfields(label: emailId,value: emailController),
          CommonTextfields(label: password,value: passwordController),
          CommonTextfields(label: confirmPassword,value: confirmPasswordController),
          SizedBox(height: 60.h,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoginAndSignInButton(label: signIn,) ,
            LoginAndSignInButton(label: logIn,)],
          )
        ],
      ),
    );
  }
}