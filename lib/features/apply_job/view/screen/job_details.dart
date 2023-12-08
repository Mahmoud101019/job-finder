import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_finder_app/core/animation/slide_transition_animation.dart';
import 'package:job_finder_app/core/router/app_route.dart';
import 'package:job_finder_app/core/styel/color.dart';
import 'package:job_finder_app/core/widget/app_bar.dart';
import 'package:job_finder_app/core/widget/customElvatedButton.dart';
import 'package:job_finder_app/core/widget/job_feature.dart';
import 'package:job_finder_app/features/apply_job/view/screen/job_details_pepole.dart';
import 'package:job_finder_app/features/apply_job/view/widget/menu_bar.dart';
import 'package:job_finder_app/features/apply_job/view_model/job_cubit.dart';
import 'package:job_finder_app/features/home/view_model/home_cubit.dart';
import 'package:job_finder_app/features/saved_job/model/favourite_model.dart';
import 'package:sizer/sizer.dart';
import 'job_details_company.dart';
import 'job_details_description.dart';

class JobDetails extends StatefulWidget {
  final JobData jobData;

  const JobDetails({Key? key, required this.jobData}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  late HomeCubit homeCubit;
  late JobCubit cubit;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    cubit = JobCubit.get(context);
    homeCubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(7.h),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return customAppBar("Job detail", context, actions: [
              IconButton(
                  onPressed: () {
                    homeCubit.handleFavourite(widget.jobData);
                  },
                  icon: homeCubit.checkFavourite(widget.jobData.id)
                      ? Transform.translate(
                          offset: Offset(1.5.h, 0),
                          child: const Icon(
                            Iconsax.archive_minus5,
                            color: AppTheme.primary5,
                          ),
                        )
                      : const Icon(
                          Iconsax.archive_minus,
                        ))
            ]);
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: 65.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.jobData.image!,
                      width: 48,
                      height: 48,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      widget.jobData.name!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppTheme.neutral9,
                        fontSize: 16.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${widget.jobData.compName} • ${widget.jobData.location} ',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppTheme.neutral7,
                        fontSize: 10.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        JobFeature(
                          text: widget.jobData.jobTimeType!,
                        ),
                        JobFeature(
                          text: widget.jobData.jobType!,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: BlocBuilder<JobCubit, JobState>(
                  builder: (context, state) {
                    return CustomMenuBar(
                      pageController: pageController,
                    );
                  },
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SlideTransitionAnimation(
                      duration: const Duration(seconds: 1),
                      begin: const Offset(0.2, 0),
                      end: Offset.zero,
                      child: JobDetailsDescription(
                        jobData: widget.jobData,
                      ),
                    ),
                    SlideTransitionAnimation(
                      duration: const Duration(seconds: 1),
                      begin: const Offset(0.2, 0),
                      end: Offset.zero,
                      child: JobDetailsCompany(
                        jobData: widget.jobData,
                      ),
                    ),
                    SlideTransitionAnimation(
                      duration: const Duration(seconds: 1),
                      begin: const Offset(0.2, 0),
                      end: Offset.zero,
                      child: JobDetailsPepole(),
                    ),
                  ], // onPageChanged: (index) {
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(() {
                  Navigator.pushNamed(context, AppRoute.applyJobScreen,
                      arguments: widget.jobData);
                }, "Apply now")),
          )
        ],
      ),
    );
  }
}
