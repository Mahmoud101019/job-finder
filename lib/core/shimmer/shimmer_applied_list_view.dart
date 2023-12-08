import 'package:flutter/material.dart';
import 'package:job_finder_app/core/shimmer/shimmer_circle_avatar_effect.dart';
import 'package:job_finder_app/core/shimmer/shimmer_container_effect.dart';
import 'package:job_finder_app/core/shimmer/shimmer_job_list_view_item.dart';
import 'package:job_finder_app/core/styel/color.dart';
import 'package:job_finder_app/features/apply_job/view/widget/dotted_line.dart';
import 'package:sizer/sizer.dart';

class ShimmerAppliedListView extends StatelessWidget {
  const ShimmerAppliedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            const ShimmerJobListViewItem(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height * 0.10,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xFFD1D5DB)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ShimmerCircleAvatarEffect(),
                      SizedBox(
                        height: 1.h,
                      ),
                      ShimmerContainerEffect(
                        height: 1.2.h,
                        width: 20.w,
                      ),
                    ],
                  ),
                  DottedLine(
                    dashColor: AppTheme.neutral3,
                    totalWidth: 9.w,
                    dashWidth: 1.w,
                    dashHeight: 0.15.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ShimmerCircleAvatarEffect(),
                      SizedBox(
                        height: 1.h,
                      ),
                      ShimmerContainerEffect(
                        height: 1.2.h,
                        width: 20.w,
                      ),
                    ],
                  ),
                  DottedLine(
                    dashColor: AppTheme.neutral3,
                    totalWidth: 9.w,
                    dashWidth: 1.w,
                    dashHeight: 0.15.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ShimmerCircleAvatarEffect(),
                      SizedBox(
                        height: 1.h,
                      ),
                      ShimmerContainerEffect(
                        height: 1.2.h,
                        width: 20.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: 3,
    );
  }
}
