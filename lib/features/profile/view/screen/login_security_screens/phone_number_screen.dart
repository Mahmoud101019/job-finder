// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:job_finder_app/core/styel/color.dart';
import 'package:job_finder_app/core/widget/app_bar.dart';
import 'package:job_finder_app/core/widget/customElvatedButton.dart';
import 'package:job_finder_app/core/widget/phone_textFormField.dart';

import 'package:sizer/sizer.dart';

class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({Key? key}) : super(key: key);
  TextEditingController phoneController =
      TextEditingController(text: '0100-666-7234');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Phone Number", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Main phone number',
              style: TextStyle(
                color: AppTheme.neutral9,
                fontSize: 13.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            CustomPhoneTextFormField(
              controller: phoneController,
            ),
            SizedBox(
              height: 2.h,
            ),
            const Spacer(),
            CustomElevatedButton(() {}, "Save"),
          ],
        ),
      ),
    );
  }
}
