import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/core/widget/app_bar.dart';
import 'package:job_finder_app/core/widget/header.dart';
import 'package:job_finder_app/features/home/view_model/home_cubit.dart';
import 'package:job_finder_app/features/saved_job/view/screen/saved_job_empty.dart';
import 'package:job_finder_app/features/saved_job/view/widgte/saved_job_item.dart';
import 'package:sizer/sizer.dart';

class SavedJobScreen extends StatefulWidget {
  const SavedJobScreen({Key? key}) : super(key: key);

  @override
  State<SavedJobScreen> createState() => _SavedJobScreenState();
}

class _SavedJobScreenState extends State<SavedJobScreen> {
  late HomeCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Saved', context, leading: false),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BuildCondition(
            condition: cubit.favouriteItems.isNotEmpty,
            builder: (context) => SingleChildScrollView(
              child: Column(
                children: [
                  CustomHeader(
                    '${cubit.favouriteItems.length} Job Saved',
                    isCentered: true,
                  ),
                  SizedBox(height: 1.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.favouriteItems.length,
                      itemBuilder: (BuildContext context, int index) =>
                          SavedJobItem(
                        favouriteData: cubit.favouriteItems[index],
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(indent: 24.0, endIndent: 24.0),
                    ),
                  ),
                ],
              ),
            ),
            fallback: (context) => const SavedJobEmptyScreen(),
          );
        },
      ),
    );
  }
}
