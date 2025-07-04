import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhub/controllers/login_provider.dart';
import 'package:jobhub/controllers/signup_provider.dart';
import 'package:jobhub/models/request/auth/signup_model.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/custom_btn.dart';
import 'package:jobhub/views/common/custom_textfield.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Consumer<SignUpNotifier>(
      builder: (context, signupNotifier, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              text: "SignUp",
              actions: [],
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(CupertinoIcons.arrow_left),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
            child: Form(
              key: signupNotifier.signupFormKey,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  HeightSpacer(size: 50),
                  ReusableText(
                    text: "Hello, Welcome!",
                    style: appstyle(30, Color(kDark.value), FontWeight.w600),
                  ),
                  ReusableText(
                    text: "Fill the details to signup for an account",
                    style: appstyle(
                      30,
                      Color(kDarkGrey.value),
                      FontWeight.w600,
                    ),
                  ),
                  HeightSpacer(size: 50),
                  CustomTextField(
                    controller: name,
                    keyboardType: TextInputType.text,
                    hintText: "Full Name",
                    validator: (name) {
                      if (name!.isEmpty) {
                        return "Please enter your name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  HeightSpacer(size: 20),
                  CustomTextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    validator: (email) {
                      if (email!.isEmpty || !email.contains("@")) {
                        return "Please enter a valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  HeightSpacer(size: 20),
                  CustomTextField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    hintText: "Password",
                    obscureText: signupNotifier.obscureText,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 8) {
                        return "Please Enter a valid Password with atleast one uppercase, one lowercase. one digit, a special character and length of character";
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        signupNotifier.obscureText = signupNotifier.obscureText;
                      },
                      child: Icon(
                        signupNotifier.obscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(kDark.value),
                      ),
                    ),
                  ),
                  HeightSpacer(size: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.offAll(() => const LoginPage());
                      },
                      child: ReusableText(
                        text: "Login",
                        style: appstyle(
                          14,
                          Color(kDark.value),
                          FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  HeightSpacer(size: 50),
                  CustomButton(
                    onTap: () {
                      loginNotifier.firstTime = !loginNotifier.firstTime;
                      if (signupNotifier.validateAndSave()) {
                        SignupModel model = SignupModel(
                          username: name.text,
                          email: email.text,
                          password: password.text,
                        );
                        signupNotifier.upSignup(model);
                      } else {
                        Get.snackbar(
                          "SignUp Failed",
                          "Please Check your credentials",
                          colorText: Color(kLight.value),
                          backgroundColor: Colors.red,
                          icon: const Icon(Icons.add_alert),
                        );
                      }
                    },
                    text: "Sign Up",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
