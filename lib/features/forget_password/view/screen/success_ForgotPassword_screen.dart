// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder_app/core/router/app_route.dart';
import 'package:job_finder_app/core/styel/color.dart';
import 'package:job_finder_app/core/widget/customElvatedButton.dart';
import 'package:job_finder_app/core/widget/home_indicator.dart';

import 'package:sizer/sizer.dart';

class SuccessForgotPasswordScreen extends StatelessWidget {
  const SuccessForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
                "assets/images/auth/Password Succesfully Ilustration.svg"),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Password changed successfully!',
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
              'Your password has been changed successfully, we will let you know if there are more problems with your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.neutral5,
                fontSize: 12.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            CustomElevatedButton(() {
              Navigator.pushNamed(context, AppRoute.loginScreen);
            }, "Login"),
          ],
        ),
      ),
      bottomNavigationBar: FractionallySizedBox(
          widthFactor: 0.36, child: homeIndicator(context)),
    );
  }
}
