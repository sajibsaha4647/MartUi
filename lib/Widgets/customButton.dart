import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:martui/Const/AppColors.dart';

Widget customButton(String buttonText, onPressed, status) {
  return SizedBox(
    width: 1.sw,
    height: 56.h,
    child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolors.deep_orange,
          elevation: 3,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
                height: 20.h,
                width: 20.h,
                child: status == true
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : null)
          ],
        )),
  );
}
