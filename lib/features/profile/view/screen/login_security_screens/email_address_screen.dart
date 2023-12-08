// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_finder_app/core/database/local_database/cache_helper.dart';
import 'package:job_finder_app/core/enums.dart';
import 'package:job_finder_app/core/styel/color.dart';
import 'package:job_finder_app/core/widget/TextFormField.dart';
import 'package:job_finder_app/core/widget/app_bar.dart';
import 'package:job_finder_app/core/widget/customElvatedButton.dart';
import 'package:sizer/sizer.dart';

class EmailAddressScreen extends StatelessWidget {
  EmailAddressScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController(
      text: CashHelper.getString(key: MySharedKeys.email));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Email Address", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Main e-mail address',
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
                CustomTextFormField(
                  controller: emailController,
                  prefixIcon: const Icon(Iconsax.sms),
                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                      states.contains(MaterialState.focused)
                          ? AppTheme.neutral9
                          : AppTheme.neutral3),
                  hintText: 'Email address',
                  obscureText: false,
                ),
                const Spacer(),
                CustomElevatedButton(() {}, "Save"),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(() {}, "Save")),
          ],
        ),
      ),
    );
  }
}
