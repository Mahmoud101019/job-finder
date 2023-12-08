import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/core/bloc_observer.dart';
import 'package:job_finder_app/core/database/local_database/cache_helper.dart';
import 'package:job_finder_app/core/database/remoteDatabase/DioHelper.dart';
import 'package:job_finder_app/core/router/app_router.dart';
import 'package:job_finder_app/features/applied_job/view_model/applied_job_cubit.dart';
import 'package:job_finder_app/features/apply_job/view_model/job_cubit.dart';
import 'package:job_finder_app/features/bottomnavigationbar/view_model/layout_cubit.dart';
import 'package:job_finder_app/features/forget_password/view_model/forget_password_cubit.dart';
import 'package:job_finder_app/features/home/view_model/home_cubit.dart';
import 'package:job_finder_app/features/login/view_model/login_cubit.dart';
import 'package:job_finder_app/features/onboarding/view_model/onboarding_cubit.dart';
import 'package:job_finder_app/features/profile/view_model/profile_cubit.dart';
import 'package:job_finder_app/features/saved_job/view_model/favourite_cubit.dart';
import 'package:job_finder_app/features/search/view_model/search_cubit.dart';
import 'package:job_finder_app/features/signup/view_model/register_cubit.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  CashHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<OnboardingCubit>(
              create: (context) => OnboardingCubit(),
            ),
            BlocProvider<RegisterCubit>(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(),
            ),
            BlocProvider<ForgetPasswordCubit>(
              create: (context) => ForgetPasswordCubit(),
            ),
            BlocProvider<LayoutCubit>(
              create: (context) => LayoutCubit(),
            ),
            BlocProvider(
              create: (context) => HomeCubit()
                ..getAllRecentJobs()
                ..getAllSuggestJobs()
                ..getFavouriteJobs(),
            ),
            BlocProvider(
              create: (context) => JobCubit(),
            ),
            BlocProvider(
              create: (context) => FavouriteCubit(),
            ),
            BlocProvider<SearchCubit>(
              create: (context) => SearchCubit(),
            ),
            BlocProvider(
              create: (context) => ProfileCubit()
                ..getProfileDetailsAndPortfolios()
                ..getProfileNameAndEmail(),
            ),
            BlocProvider<AppliedJobCubit>(
              create: (context) => AppliedJobCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'SFProDisplay',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: onGenerateRouter,
          ),
        );
      },
    );
  }
}
