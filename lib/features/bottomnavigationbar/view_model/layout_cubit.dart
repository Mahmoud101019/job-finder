// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/core/database/local_database/cache_helper.dart';
import 'package:job_finder_app/core/enums.dart';
import 'package:job_finder_app/features/applied_job/view/screens/applied_job.dart';
import 'package:job_finder_app/features/home/view/screen/home_screen.dart';
import 'package:job_finder_app/features/messsages_screen/view/screens/messages_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/complete_profile_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/profile_screen.dart';
import 'package:job_finder_app/features/saved_job/view/screen/saved_job_screen.dart';
import 'package:meta/meta.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void getCompleteProfile() {
    if (CashHelper.getString(key: MySharedKeys.completeProfile) == 'true') {
      screens[4] = const ProfileScreen();
    } else {
      screens[4] = const CompleteProfileScreen();
    }
  }

  List<Widget> screens = [
    const HomeScreen(),
    MessagesScreen(),
    const AppliedJobScreen(),
    const SavedJobScreen(),
    const CompleteProfileScreen(),
  ];

  List<String> titles = [
    'Home',
    'Messages',
    'Applied',
    'Saved',
    'Profile',
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNacBarState());
  }
}
