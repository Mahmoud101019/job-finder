import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/core/database/local_database/cache_helper.dart';
import 'package:job_finder_app/core/enums.dart';
import 'package:job_finder_app/core/styel/color.dart';
import 'package:job_finder_app/core/widget/app_bar.dart';
import 'package:job_finder_app/core/widget/customElvatedButton.dart';
import 'package:job_finder_app/core/widget/snack_bar.dart';
import 'package:job_finder_app/features/apply_job/view/widget/portfolio_item.dart';
import 'package:job_finder_app/features/profile/view_model/profile_cubit.dart';

import 'package:sizer/sizer.dart';
import '../widgets/upload_file.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Portfolio', context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add portfolio here',
                    style: TextStyle(
                      color: AppTheme.neutral9,
                      fontSize: 16.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  const UploadFile(
                    target: 'CV',
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return BuildCondition(
                        condition: cubit.selectedCVFile != null,
                        builder: (context) => CustomPortfolioItem(
                          text: cubit.selectedCVFile!.path.split('/').last,
                          size: ((cubit.selectedCVFile!.lengthSync()) /
                                  1024 /
                                  1024)
                              .toStringAsFixed(2),
                          selectedFile: cubit.selectedCVFile!,
                        ),
                        fallback: (context) => const SizedBox.shrink(),
                      );
                    },
                  ),
                  SizedBox(height: 3.h),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is AddCVSuccessState) {
                    showSuccessSnackBar(
                        context: context,
                        message: 'Portfolio Updated Successfully');
                    Navigator.pop(context);
                  } else if (state is AddCVErrorState) {
                    showErrorSnackBar(
                        context: context,
                        message: 'There something wrong, Try Again');
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(() {
                    if (cubit.selectedCVFile != null) {
                      cubit.addPortofolio();
                    }
                    if (CashHelper.getString(
                            key: MySharedKeys.completeProfile) ==
                        '') {
                      cubit.addItem('Portfolio');
                    }
                  }, 'Save');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
