// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/core/database/local_database/cache_helper.dart';
import 'package:job_finder_app/core/database/remoteDatabase/DioHelper.dart';
import 'package:job_finder_app/core/database/remoteDatabase/endpoints.dart';
import 'package:job_finder_app/core/enums.dart';
import 'package:job_finder_app/features/applied_job/model/applied_job_model.dart';
import 'package:job_finder_app/features/saved_job/model/favourite_model.dart';
import 'package:meta/meta.dart';


part 'applied_job_state.dart';

class AppliedJobCubit extends Cubit<AppliedJobState> {
  AppliedJobCubit() : super(AppliedJobInitial());

  static AppliedJobCubit get(context) => BlocProvider.of(context);

  int activeIndex = 0;
  changeIndex(index) {
    activeIndex = index;
    emit(ChangeIndex());
  }

  List<JobData> appliedJobsData = [];

  void getAppliedJobs({required String jobId}) {
    emit(GetAppliedJobsLoading());
    DioHelper.getData(url: '$allJobsURL/$jobId').then((value) {
      appliedJobsData.add(JobData.fromJson(value.data['data']));

      if (appliedJobsData.isEmpty) {
        emit(AppliedJobEmpty());
      } else {
        emit(GetAppliedJobsSuccessfully());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetAppliedJobsError());
    });
  }

  void getAppliedJobsId() {
    emit(GetAppliedJobsIDLoading());
    DioHelper.getData(
            url:
                '$applyJobURL/${CashHelper.getString(key: MySharedKeys.userId)}')
        .then((value) {
      if (value.data['data'].isEmpty) {
        emit(AppliedJobEmpty());
        // print('yes');
      } else {
        for (var job in value.data['data']) {
          String id = AppliedJobData.fromJson(job).jobsId.toString();
          getAppliedJobs(jobId: id);
        }
        emit(GetAppliedJobsIDSuccessfully());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetAppliedJobsIDError());
    });
  }
}
