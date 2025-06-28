import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/drawer/drawer_widget.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/common/width_spacer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Profile',
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: width,
              height: hieght * 0.12,
              color: Color(kLight.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: CachedNetworkImage(
                          width: 80.w,
                          height: 100.h,
                          imageUrl:
                              'https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality.jpg',
                        ),
                      ),
                    ],
                  ),
                  WidthSpacer(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                        text: 'John Doe',
                        style: appstyle(
                          20,
                          Color(kDark.value),
                          FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            MaterialIcons.location_pin,
                            color: Color(kDarkGrey.value),
                          ),
                          WidthSpacer(width: 5),
                          ReusableText(
                            text: 'Washington DC',
                            style: appstyle(
                              16,
                              Color(kDarkGrey.value),
                              FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  WidthSpacer(width: width * 0.1),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Feather.edit, size: 18),
                  ),
                ],
              ),
            ),
            HeightSpacer(size: 20),
            Stack(
              children: [
                Container(
                  width: width,
                  height: hieght * 0.12,
                  color: Color(kLightGrey.value),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        width: 60.w,
                        height: 70.h,
                        color: Color(kLight.value),
                        child: Icon(
                          FontAwesome5Regular.file_pdf,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusableText(
                            text: "Resume From Jobhub",
                            style: appstyle(
                              16,
                              Color(kDark.value),
                              FontWeight.w500,
                            ),
                          ),
                          ReusableText(
                            text: "Jobhub Resume",
                            style: appstyle(
                              16,
                              Color(kDarkGrey.value),
                              FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      WidthSpacer(width: 1),
                    ],
                  ),
                ),
                Positioned(
                  top: 2.h,
                  right: 5.w,
                  child: GestureDetector(
                    onTap: () {},
                    child: ReusableText(
                      text: "Edit",
                      style: appstyle(
                        16,
                        Color(kOrange.value),
                        FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            HeightSpacer(size: 20),
            Container(
              padding: EdgeInsets.only(left: 8),
              width: width,
              height: hieght * 0.06,
              color: Color(kLightGrey.value),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ReusableText(
                  text: "@JohnDoe",
                  style: appstyle(16, Color(kDark.value), FontWeight.w600),
                ),
              ),
            ),
            HeightSpacer(size: 20),
            Container(
              padding: EdgeInsets.only(left: 8),
              width: width,
              height: hieght * 0.06,
              color: Color(kLightGrey.value),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/usa.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                    WidthSpacer(width: 15),
                    ReusableText(
                      text: "7880062195",
                      style: appstyle(16, Color(kDark.value), FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            HeightSpacer(size: 20),
            Container(
              color: Color(kLightGrey.value),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: ReusableText(
                      text: "Skills",
                      style: appstyle(16, Color(kDark.value), FontWeight.w600),
                    ),
                  ),
                  HeightSpacer(size: 3),
                  SizedBox(
                    height: hieght * 0.5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: skills.length,
                        itemBuilder: (context, index) {
                          final skill = skills[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              width: width,
                              height: hieght * 0.06,
                              color: Color(kLight.value),
                              child: ReusableText(
                                text: skill,
                                style: appstyle(
                                  16,
                                  Color(kDark.value),
                                  FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
