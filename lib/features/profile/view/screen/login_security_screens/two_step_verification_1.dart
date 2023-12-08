// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_finder_app/core/router/app_route.dart';
import 'package:job_finder_app/core/styel/color.dart';
import 'package:job_finder_app/core/widget/app_bar.dart';
import 'package:job_finder_app/core/widget/customElvatedButton.dart';
import 'package:sizer/sizer.dart';

class TwoStepVerification1 extends StatelessWidget {
  TwoStepVerification1({Key? key}) : super(key: key);
  TextEditingController phoneController =
      TextEditingController(text: '0100-666-7234');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Two-step verification", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 4.h,
            ),
            const TwoStepVerificationTile(
                icon: Iconsax.sms,
                text:
                    "Two-step verification provides additional security by asking for a verification code every time you log in on another device."),
            SizedBox(
              height: 2.h,
            ),
            const TwoStepVerificationTile(
                icon: Iconsax.external_drive,
                text:
                    "Adding a phone number or using an authenticator will help keep your account safe from harm."),
            const Spacer(),
            CustomElevatedButton(() {
              Navigator.pushNamed(context, AppRoute.twoStepVerification2);
            }, "Next"),
          ],
        ),
      ),
    );
  }
}

class TwoStepVerificationTile extends StatelessWidget {
  final IconData icon;
  final String text;
  const TwoStepVerificationTile(
      {Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 11.w,
        height: 5.h,
        decoration: const ShapeDecoration(
          color: AppTheme.primary1,
          shape: CircleBorder(),
        ),
        child: Center(
            child: Icon(
          icon,
          color: AppTheme.primary5,
        )),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: AppTheme.neutral5,
          fontSize: 11.5.sp,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
