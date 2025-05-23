import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/en.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextfields extends StatefulWidget {
  String label;
   TextEditingController value;

   CommonTextfields({super.key,required   this.label , required  this. value});

  @override
  State<CommonTextfields> createState() => _CommonTextfieldsState();
}

class _CommonTextfieldsState extends State<CommonTextfields> {
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SizedBox(height: 30.h,),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Text(widget.label,style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.w800),),
        ),
        SizedBox(height: 5.h,),
        Container(
        margin: EdgeInsets.symmetric(horizontal: 25.w),
      
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: TextFormField(
          controller: widget.value,
          obscureText:( widget.label == password || widget.label == confirmPassword),
          maxLength: 80,
                    textInputAction: widget.label == confirmPassword ?  TextInputAction.done : TextInputAction.next, // Moves focus to next.

         
          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17.sp),
          decoration: InputDecoration(
            border: InputBorder.none,
           counterText: '',
           contentPadding: EdgeInsets.only(left: 5.w),
          ),
        ),
      ), 
      ],
    );
  }
}