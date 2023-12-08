import 'package:flutter/material.dart';
import 'package:job_finder_app/core/database/local_database/cache_helper.dart';
import 'package:job_finder_app/core/enums.dart';
import 'package:job_finder_app/core/router/app_route.dart';
import 'package:job_finder_app/core/widget/app_bar.dart';
import 'package:job_finder_app/core/widget/header.dart';
import '../widgets/account_access_tile.dart';

class LoginAndSecurityScreen extends StatelessWidget {
  const LoginAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Login and security', context),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const CustomHeader('Account access'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                CustomAccountAccessTile(
                  title: "Email address",
                  trailingTitle: CashHelper.getString(key: MySharedKeys.email),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.emailAddressScreen);
                  },
                ),
                CustomAccountAccessTile(
                  title: "Phone number",
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.phoneNumberScreen);
                  },
                ),
                CustomAccountAccessTile(
                  title: "Change Password",
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.changePasswordScreen);
                  },
                ),
                CustomAccountAccessTile(
                  title: 'Two-step verification',
                  trailingTitle: 'Non active',
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.twoStepVerification1);
                  },
                ),
                const CustomAccountAccessTile(title: 'Face ID'),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
