import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder_app/core/router/app_route.dart';
import 'package:job_finder_app/core/styel/color.dart';
import 'package:job_finder_app/core/widget/app_bar.dart';
import 'package:job_finder_app/core/widget/customElvatedButton.dart';
import 'package:sizer/sizer.dart';

class ApplyJobSuccessfully extends StatelessWidget {
  const ApplyJobSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Apply Job", context, leading: false),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                      "assets/images/home/Data Ilustration (1).svg"),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Your data has been successfully sent',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.neutral9,
                      fontSize: 20.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    'You will get a message from our team, about the announcement of employee acceptance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.neutral5,
                      fontSize: 13.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(() {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoute.layoutScreen, (route) => false);
                }, "Back to home"))
          ],
        ),
      ),
    );
  }
}
