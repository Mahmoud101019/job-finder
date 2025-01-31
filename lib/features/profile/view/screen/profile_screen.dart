import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_finder_app/core/animation/slide_transition_animation.dart';
import 'package:job_finder_app/core/database/local_database/cache_helper.dart';
import 'package:job_finder_app/core/enums.dart';
import 'package:job_finder_app/core/router/app_route.dart';
import 'package:job_finder_app/core/styel/color.dart';
import 'package:job_finder_app/core/widget/app_bar.dart';
import 'package:job_finder_app/core/widget/header.dart';
import 'package:job_finder_app/core/widget/snack_bar.dart';
import 'package:job_finder_app/features/profile/view/widgets/general_data.dart';
import 'package:job_finder_app/features/profile/view/widgets/others_data.dart';
import 'package:job_finder_app/features/profile/view/widgets/personal_details.dart';
import 'package:job_finder_app/features/profile/view/widgets/profile_header.dart';
import 'package:job_finder_app/features/profile/view_model/profile_cubit.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit.get(context)..loadSavedProfileImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        'Profile',
        context,
        leading: false,
        actions: [
          IconButton(
            onPressed: () {
              CashHelper.removeCacheKey(key: MySharedKeys.token).then((value) {
                if (!context.mounted) return null;
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoute.loginScreen, (route) => false);
                showSuccessSnackBar(
                    context: context, message: 'Logged out Successfully');
              });
            },
            icon: const Icon(
              Iconsax.logout_1,
              color: Colors.red,
            ),
          )
        ],
        backgroundColor: AppTheme.primary1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SlideTransitionAnimation(
              duration: Duration(seconds: 1),
              begin: Offset(0, 0.2),
              end: Offset.zero,
              child: ProfileHeader(),
            ),
            const SlideTransitionAnimation(
                duration: Duration(seconds: 1),
                begin: Offset(0, 0.2),
                end: Offset.zero,
                child: ProfilePersonalDetails()),
            const CustomHeader('General'),
            SizedBox(
              height: 1.h,
            ),
            const GeneralDataListTile(),
            const CustomHeader('Others'),
            const OtherDataListTile()
          ],
        ),
      ),
    );
  }
}
