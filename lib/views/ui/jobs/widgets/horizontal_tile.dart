import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/views/common/app_style.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/common/reusable_text.dart';
import 'package:jobhub/views/common/width_spacer.dart';

class JobHorizontalTile extends StatelessWidget {
  const JobHorizontalTile({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          width: width * 0.7,
          height: hieght * 0.27,
          color: Color(kLightGrey.value),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/facebook.png'),
                    radius: 20,
                  ),
                  WidthSpacer(width: 15),
                  ReusableText(
                    text: "FaceBook",
                    style: appstyle(18, Color(kDark.value), FontWeight.w600),
                  ),
                ],
              ),
              HeightSpacer(size: 15),
              ReusableText(
                text: "Senior Flutter Developer",
                style: appstyle(20, Color(kDark.value), FontWeight.w500),
              ),
              ReusableText(
                text: "Washington DC",
                style: appstyle(16, Color(kDarkGrey.value), FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ReusableText(
                        text: "15k",
                        style: appstyle(
                          23,
                          Color(kDark.value),
                          FontWeight.w500,
                        ),
                      ),
                      ReusableText(
                        text: "/monthly",
                        style: appstyle(
                          23,
                          Color(kDarkGrey.value),
                          FontWeight.w500,
                        ),
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(kLight.value),
                        child: Icon(Ionicons.chevron_forward),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
