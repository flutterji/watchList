import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/en.dart';
import 'package:flutter_application_1/dashBoard/dash_Board_Page.dart';
import 'package:flutter_application_1/loginPage/login_And_Sign_In_Page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginAndSignInButton extends StatefulWidget {
  String label;
  LoginAndSignInButton({super.key, required this.label});

  @override
  State<LoginAndSignInButton> createState() => _LoginAndSignInButtonState();
}

class _LoginAndSignInButtonState extends State<LoginAndSignInButton> {
  Future<void> loginAndsignUp() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            pleaseFillInLoginCredentials,
            style: TextStyle(color: blackColor),
          ),
          backgroundColor: whiteColor,
        ),
      );
      return;
    } else if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            pleaseEntervalidCerdentials,
            style: TextStyle(color: blackColor),
          ),
          backgroundColor: whiteColor,
        ),
      );
      return;
    } else if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            enteredPasswordDoesNotMatch,
            style: TextStyle(color: blackColor),
          ),
          backgroundColor: whiteColor,
        ),
      );
      return;
    }

    try {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(loading, style: TextStyle(color: blackColor)),
            backgroundColor: whiteColor,
          ),
        );
      }

      final AuthResponse response;
      if (widget.label == logIn) {
        response = await Supabase.instance.client.auth.signInWithPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        response = await Supabase.instance.client.auth.signUp(
          email: emailController.text,
          password: passwordController.text,
        );
      }

      if (response.user != null) {

        print('sasaassa : - ${response.user} , ${emailController.text}');
       

        if (widget.label == logIn) {
           if(mounted){
ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
          var sharedPref = EncryptedSharedPreferences.getInstance();

          await sharedPref.setBoolean('userLoggedIn', true);
          if (mounted) {
            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                duration: Duration(seconds: 5),
                                reverseDuration: Duration(seconds: 5),
                                type: PageTransitionType.rightToLeft,
                                child: DashBoardPage(
                                 
                                ),
                              ),
                            );
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  signUpSuccessful,
                  style: TextStyle(color: blackColor),
                ),
                backgroundColor: whiteColor,
              ),
            );
          }
        }
      }
    } on AuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$error$e', style: TextStyle(color: blackColor)),
            backgroundColor: whiteColor,
            duration: Duration(milliseconds: 5000),
          ),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              unexpectedErrorOccurred,
              style: TextStyle(color: blackColor),
            ),
            backgroundColor: whiteColor,
            duration: Duration(milliseconds: 5000),
          ),
        );
      }
    }
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: BouncingWidget(
       duration: Duration(milliseconds: 100),
  scaleFactor: 1.5,
        
         onPressed: () {
        EasyDebounce.debounce(
          '', // <-- An ID for this particular debouncer
          Duration(milliseconds: 500), // <-- The debounce duration
          () => loginAndsignUp(), // <-- The target method
        );
      },
      
        child: Container(
                    width: 140.w,
                    height: 50.h,
              
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
        
          ),
              
          child: Text(
            widget.label,
            style: TextStyle(
              color: blackColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
