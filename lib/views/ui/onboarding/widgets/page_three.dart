import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/views/common/app_style.dart';
import 'package:jobhub/views/common/custom_outline_btn.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/common/reusable_text.dart';
import 'package:jobhub/views/ui/auth/login.dart';
import 'package:jobhub/views/ui/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: hieght,
        color: Color(kLightBlue.value),
        child: Column(
          children: [
            Image.asset("assets/images/page3.png"),
            HeightSpacer(size: 20),
            ReusableText(
              text: "Welcome to JobHub",
              style: appstyle(30, Color(kLight.value), FontWeight.w600),
            ),

            const HeightSpacer(size: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Center(
                child: Text(
                  "Find your dream job According to your Skills \nWe will Help you to get most suitable and perfect job for you",
                  style: appstyle(14, Color(kLight.value), FontWeight.normal),
                ),
              ),
            ),
            HeightSpacer(size: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomOutlineBtn(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('entryPoint', true);
                    Get.to(() => const LoginPage());
                  },
                  text: "Login",
                  width: width * 0.4,
                  height: hieght * 0.06,
                  color: Color(kLight.value),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const RegistrationPage());
                  },
                  child: Container(
                    width: width * 0.4,
                    height: hieght * 0.06,
                    color: Color(kLight.value),
                    child: Center(
                      child: ReusableText(
                        text: "Sign Up",
                        style: appstyle(
                          16,
                          Color(kLightBlue.value),
                          FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            HeightSpacer(size: 30),
            ReusableText(
              text: "Continue As Guest",
              style: appstyle(16, Color(kLight.value), FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
