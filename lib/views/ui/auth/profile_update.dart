import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:jobhub/controllers/login_provider.dart';
import 'package:jobhub/models/request/auth/profile_update_model.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/custom_btn.dart';
import 'package:jobhub/views/common/custom_textfield.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:provider/provider.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  late TextEditingController skill0;
  late TextEditingController skill1;
  late TextEditingController skill2;
  late TextEditingController skill3;
  late TextEditingController skill4;

  get loginNotifier => null;

  @override
  void initState() {
    super.initState();
    skill0 = TextEditingController(text: profile[0]);
    skill1 = TextEditingController(text: profile[1]);
    skill2 = TextEditingController(text: profile[2]);
    skill3 = TextEditingController(text: profile[3]);
    skill4 = TextEditingController(text: profile[4]);
  }

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: "Update Profile",
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(CupertinoIcons.arrow_left),
          ),
        ),
      ),
      body: Consumer<LoginNotifier>(
        builder: (context, loginNotifier, child) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ReusableText(
                      text: "Personal Details",
                      style: appstyle(30, Color(kDark.value), FontWeight.bold),
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
                      style: appstyle(25, Color(kDark.value), FontWeight.bold),
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
          );
        },
      ),
    );
  }
}
