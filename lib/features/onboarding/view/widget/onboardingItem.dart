// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder_app/core/animation/slide_transition_animation.dart';
import 'package:job_finder_app/core/styel/color.dart';
import 'package:job_finder_app/features/onboarding/model/onborading_model.dart';
import 'package:sizer/sizer.dart';

class BoardingItem extends StatelessWidget {
  final OnboardingModel model;
  const BoardingItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransitionAnimation(duration: const Duration(seconds:1), begin:  const Offset(0.2, 0), end: Offset.zero,
            child: SvgPicture.asset(model.image,
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),),

          SizedBox(height: 0.5.h,),
          SlideTransitionAnimation(duration: const Duration(seconds: 1), begin:  const Offset(0.1, 0), end: Offset.zero,
            child:  Padding(
              padding:  const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: model.title

            ),),

          SizedBox(height: 0.5.h,),
          SlideTransitionAnimation(duration: const Duration(seconds: 1), begin:  const Offset(0.1, 0), end: Offset.zero,
            child: Padding(
              padding:  const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: Center(
                child: Text(model.body, style:  TextStyle(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily:'SFProDisplay',
                  color: AppTheme.neutral5,
                ),
                ),
              ),
            ),),

        ],
      ),
    );
  }
}




