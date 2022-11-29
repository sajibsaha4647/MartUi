import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:martui/Const/AppColors.dart';
import 'package:martui/Widgets/customButton.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolors.deep_orange,
        body: Column(
          children: [
            SizedBox(
              height: 120.h,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10.h),
              child: Text("Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Container(
                  width: ScreenUtil().screenWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r))),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 22.sp, color: Appcolors.deep_orange),
                          ),
                          Text(
                            "Glad to see you back my buddy.",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFFBBBBBB),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 48.h,
                                width: 41.w,
                                decoration: BoxDecoration(
                                  color: Appcolors.deep_orange,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                    size: 20.w,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                  child: Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: TextField(
                                  onTap: () {},
                                  textAlignVertical: TextAlignVertical.top,
                                  textAlign: TextAlign.start,
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter email address",
                                    alignLabelWithHint: true,
                                    hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF414041),
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 48.h,
                                width: 41.w,
                                decoration: BoxDecoration(
                                  color: Appcolors.deep_orange,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                    size: 20.w,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                  child: Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: TextField(
                                  onTap: () {},
                                  textAlignVertical: TextAlignVertical.top,
                                  textAlign: TextAlign.start,
                                  obscureText: _obscureText,
                                  controller: _passwordController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your Password",
                                    alignLabelWithHint: true,
                                    hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF414041),
                                    ),
                                    suffixIcon: _obscureText == true
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _obscureText = false;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.remove_red_eye,
                                              size: 20.w,
                                              color: Colors.black,
                                            ))
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _obscureText = true;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.visibility_off,
                                              size: 20.w,
                                              color: Colors.black,
                                            )),
                                  ),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          customButton("Login", () {}, false)
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
