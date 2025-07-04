import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:jobhub/models/request/auth/profile_update_model.dart';
import 'package:jobhub/views/common/custom_btn.dart';
import 'package:jobhub/views/common/custom_textfield.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController skill0 = TextEditingController();
  TextEditingController skill1 = TextEditingController();
  TextEditingController skill2 = TextEditingController();
  TextEditingController skill3 = TextEditingController();
  TextEditingController skill4 = TextEditingController();

  @override
  void dispose() {
    phone.dispose();
    location.dispose();
    skill0.dispose();
    skill1.dispose();
    skill2.dispose();
    skill3.dispose();
    skill4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginNotifier>(
        builder: (context, loginNotifier, child) {
          return Form(
            key: loginNotifier.profileFormKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ReusableText(
                        text: "Personal Details",
                        style: appstyle(
                          30,
                          Color(kDark.value),
                          FontWeight.bold,
                        ),
                      ),
                    ),
                    // Consumer<ImageUploader>(
                    //   builder: (context, imageUploader, child) {
                    //     return imageUploader.imageFile.isEmpty
                    //         ? GestureDetector(
                    //             onTap: () {
                    //               imageUploader.pickImage();
                    //             },
                    //             child: CircleAvatar(
                    //               backgroundColor: Color(kLightBlue.value),
                    //               // backgroundImage: ,
                    //               child: Center(
                    //                 child: Icon(Icons.photo_filter_rounded),
                    //               ),
                    //             ),
                    //           )
                    //         : GestureDetector(
                    //             onTap: () {
                    //               imageUploader.imageFile.clear();
                    //               setState(() {});
                    //             },
                    //             child: CircleAvatar(
                    //               backgroundColor: Color(kLightBlue.value),
                    //               backgroundImage: FileImage(
                    //                 File(imageUploader.imageFile[0]),
                    //               ),
                    //             ),
                    //           );
                    //   },
                    // ),
                  ],
                ),
                HeightSpacer(size: 20),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: location,
                        hintText: "Location",
                        keyboardType: TextInputType.text,
                        validator: (location) {
                          if (location!.isNotEmpty) {
                            return "Please enter a valid location";
                          } else {
                            return null;
                          }
                        },
                      ),
                      HeightSpacer(size: 10),

                      CustomTextField(
                        controller: phone,
                        hintText: "Phone Number",
                        keyboardType: TextInputType.phone,
                        validator: (phone) {
                          if (phone!.isNotEmpty) {
                            return "Please enter a valid location";
                          } else {
                            return null;
                          }
                        },
                      ),
                      HeightSpacer(size: 10),
                      ReusableText(
                        text: "Professional Skills",
                        style: appstyle(
                          25,
                          Color(kDark.value),
                          FontWeight.bold,
                        ),
                      ),
                      HeightSpacer(size: 10),

                      CustomTextField(
                        controller: skill0,
                        hintText: "Professional Skills",
                        keyboardType: TextInputType.text,
                        validator: (skill0) {
                          if (skill0!.isNotEmpty) {
                            return "Please enter a valid location";
                          } else {
                            return null;
                          }
                        },
                      ),
                      HeightSpacer(size: 10),

                      CustomTextField(
                        controller: skill1,
                        hintText: "Professional Skills",
                        keyboardType: TextInputType.text,
                        validator: (skill1) {
                          if (skill1!.isNotEmpty) {
                            return "Please enter a valid location";
                          } else {
                            return null;
                          }
                        },
                      ),
                      HeightSpacer(size: 10),

                      CustomTextField(
                        controller: skill2,
                        hintText: "Professional Skills",
                        keyboardType: TextInputType.text,
                        validator: (skill2) {
                          if (skill2!.isNotEmpty) {
                            return "Please enter a valid location";
                          } else {
                            return null;
                          }
                        },
                      ),
                      HeightSpacer(size: 10),

                      CustomTextField(
                        controller: skill3,
                        hintText: "Professional Skills",
                        keyboardType: TextInputType.text,
                        validator: (skill3) {
                          if (skill3!.isNotEmpty) {
                            return "Please enter a valid location";
                          } else {
                            return null;
                          }
                        },
                      ),
                      HeightSpacer(size: 10),

                      CustomTextField(
                        controller: skill4,
                        hintText: "Professional Skills",
                        keyboardType: TextInputType.text,
                        validator: (skill4) {
                          if (skill4!.isNotEmpty) {
                            return "Please enter a valid location";
                          } else {
                            return null;
                          }
                        },
                      ),
                      HeightSpacer(size: 20),
                      // Consumer<ImageUploader>(
                      //   builder: (context, imageUpload, child) {
                      //     return CustomButton(
                      //       onTap: () {
                      //         if (imageUpload.imageFile.isEmpty &&
                      //             imageUpload.imageUrl == null) {
                      //           Get.snackbar(
                      //             "Image Missing",
                      //             "Please upload an image to procees",
                      //             colorText: Color(kLight.value),
                      //             backgroundColor: Color(kLightBlue.value),
                      //             icon: const Icon(Icons.add_alert),
                      //           );
                      //         } else {
                      //           ProfileUpdateReq model = ProfileUpdateReq(
                      //             location: location.text,
                      //             phone: phone.text,
                      //             skills: [
                      //               skill0.text,
                      //               skill1.text,
                      //               skill2.text,
                      //               skill3.text,
                      //               skill4.text,
                      //             ],
                      //           );
                      //           loginNotifier.updateProfile(model);
                      //         }
                      //       },
                      //       text: "Update Profile",
                      //     );
                      //   },
                      // ),
                      CustomButton(
                        onTap: () {
                          ProfileUpdateReq model = ProfileUpdateReq(
                            location: location.text,
                            phone: phone.text,
                            skills: [
                              skill0.text,
                              skill1.text,
                              skill2.text,
                              skill3.text,
                              skill4.text,
                            ],
                          );
                          loginNotifier.updateProfile(model);
                        },
                        text: "Update Profile",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
