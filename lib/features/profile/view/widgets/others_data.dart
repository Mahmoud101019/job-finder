// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_finder_app/core/router/app_route.dart';
import 'package:job_finder_app/features/profile/view/widgets/profile_tile.dart';

class OtherDataListTile extends StatelessWidget {
  const OtherDataListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomSystemTile('Accesibility', withIcon: false),

          CustomSystemTile('Help Center', withIcon: false,
          onTap: (){
            Navigator.pushNamed(context, AppRoute.helpCenterScreen);
          },
          ),
          CustomSystemTile('Terms & Conditions', withIcon: false,
          onTap: (){
            Navigator.pushNamed(context, AppRoute.termsAndConditionsScreen);
          },
          ),
          CustomSystemTile('Privacy Policy', withIcon: false,
          onTap: (){
            Navigator.pushNamed(context, AppRoute.privacyAndPolicyScreen);
          },
          ),
        ],
      ),
    );
  }
}
