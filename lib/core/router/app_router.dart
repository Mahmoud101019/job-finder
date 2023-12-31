import 'package:flutter/material.dart';
import 'package:job_finder_app/core/animation/page_slide_transition.dart';
import 'package:job_finder_app/core/router/app_route.dart';
import 'package:job_finder_app/features/apply_job/view/screen/apply_job_screen.dart';
import 'package:job_finder_app/features/apply_job/view/screen/apply_successfully.dart';
import 'package:job_finder_app/features/apply_job/view/screen/job_details.dart';
import 'package:job_finder_app/features/apply_job/view/widget/image_screen.dart';
import 'package:job_finder_app/features/apply_job/view/widget/pdf_screen.dart';
import 'package:job_finder_app/features/bottomnavigationbar/view/screen/layout_app.dart';
import 'package:job_finder_app/features/forget_password/view/screen/checkmail_password_screen.dart';
import 'package:job_finder_app/features/forget_password/view/screen/create_new_password.dart';
import 'package:job_finder_app/features/forget_password/view/screen/forgotpassword_screen.dart';
import 'package:job_finder_app/features/forget_password/view/screen/success_ForgotPassword_screen.dart';
import 'package:job_finder_app/features/home/view/screen/home_screen.dart';
import 'package:job_finder_app/features/login/view/screen/login_screen.dart';
import 'package:job_finder_app/features/notification/view/screen/notification_screen.dart';
import 'package:job_finder_app/features/onboarding/view/screen/onboarding_screen.dart';
import 'package:job_finder_app/features/profile/model/pdf_args.dart';
import 'package:job_finder_app/features/profile/view/screen/complete_profile_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/edit_details_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/education_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/experience_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/help_center_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/language_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/login_security_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/login_security_screens/change_password.dart';
import 'package:job_finder_app/features/profile/view/screen/login_security_screens/email_address_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/login_security_screens/phone_number_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/login_security_screens/two_step_verification_1.dart';
import 'package:job_finder_app/features/profile/view/screen/login_security_screens/two_step_verification_2.dart';
import 'package:job_finder_app/features/profile/view/screen/login_security_screens/two_step_verification_3.dart';
import 'package:job_finder_app/features/profile/view/screen/login_security_screens/two_step_verification_4.dart';
import 'package:job_finder_app/features/profile/view/screen/notification_settings_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/portfolio_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/privacy_policy_screen.dart';
import 'package:job_finder_app/features/profile/view/screen/terms_conditions_screen.dart';
import 'package:job_finder_app/features/saved_job/model/favourite_model.dart';
import 'package:job_finder_app/features/search/view/screens/search_screen.dart';
import 'package:job_finder_app/features/signup/view/screen/location_register_screen.dart';
import 'package:job_finder_app/features/signup/view/screen/register_screen.dart';
import 'package:job_finder_app/features/signup/view/screen/success_register_screen.dart';
import 'package:job_finder_app/features/signup/view/screen/work_register_screen.dart';
import 'package:job_finder_app/features/splash/screen/splash_screen.dart';

Route? onGenerateRouter(RouteSettings settings) {
  switch (settings.name) {
    case AppRoute.splashScreen:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case AppRoute.onBoardingScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const OnboardingScreen());

    case AppRoute.loginScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const LoginScreen());

    case AppRoute.forgetPasswordScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const ForgotPasswordScreen());

    case AppRoute.checkEmailForgetPasswordScreen:
      return PageSlideTransition(
          direction: AxisDirection.left,
          page: const CheckMailForgotPasswordScreen());

    case AppRoute.createNewPasswordScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const CreateNewPassword());

    case AppRoute.successForgetPasswordScreen:
      return PageSlideTransition(
          direction: AxisDirection.left,
          page: const SuccessForgotPasswordScreen());

    case AppRoute.registerScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const RegisterScreen());

    case AppRoute.registerWorkScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const RegisterWorkScreen());

    case AppRoute.locationRegisterScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const LocationRegisterScreen());

    case AppRoute.successRegisterScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const SuccessRegisterScreen());

    case AppRoute.layoutScreen:
      return MaterialPageRoute(builder: (_) => const LayoutScreen());

    case AppRoute.homeScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const HomeScreen());
    case AppRoute.notificationScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const NotificationScreen());

    case AppRoute.jobDetailsScreen:
      final args = settings.arguments as JobData;
      return PageSlideTransition(
          direction: AxisDirection.right,
          page: JobDetails(
            jobData: args,
          ));

    case AppRoute.applyJobScreen:
      final args = settings.arguments as JobData;
      return PageSlideTransition(
          direction: AxisDirection.right,
          page: ApplyJob(
            jobData: args,
          ));

    case AppRoute.applyJobSuccessfullyScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const ApplyJobSuccessfully());

    case AppRoute.pdfScreen:
      final args = settings.arguments as PdfScreenArguments;

      return PageSlideTransition(
          direction: AxisDirection.left,
          page: PDFScreen(
            text: args.text,
            selectedCV: args.file,
          ));

    case AppRoute.imageScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const ImageScreen());

    case AppRoute.searchScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const SearchScreen());

    case AppRoute.editDetailsScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const EditDetalisScreen());

    case AppRoute.portfolioScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const PortfolioScreen());

    case AppRoute.languageScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const LanguageScreen());

    case AppRoute.notificationsSettingsScreen:
      return PageSlideTransition(
          direction: AxisDirection.right,
          page: const NotificationsSettingsScreen());

    case AppRoute.privacyAndPolicyScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const PrivacyAndPolicyScreen());

    case AppRoute.helpCenterScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: HelpCenterScreen());

    case AppRoute.termsAndConditionsScreen:
      return PageSlideTransition(
          direction: AxisDirection.right,
          page: const TermsAndConditionsScreen());

    case AppRoute.loginAndSecurityScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const LoginAndSecurityScreen());

    case AppRoute.emailAddressScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: EmailAddressScreen());

    case AppRoute.phoneNumberScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: PhoneNumberScreen());

    case AppRoute.changePasswordScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: ChangePasswordScreen());

    case AppRoute.twoStepVerification1:
      return PageSlideTransition(
          direction: AxisDirection.right, page: TwoStepVerification1());

    case AppRoute.twoStepVerification2:
      return PageSlideTransition(
          direction: AxisDirection.right, page: TwoStepVerification2());

    case AppRoute.twoStepVerification3:
      return PageSlideTransition(
          direction: AxisDirection.right, page: TwoStepVerification3());

    case AppRoute.twoStepVerification4:
      return PageSlideTransition(
          direction: AxisDirection.right, page: TwoStepVerification4());
    case AppRoute.experienceScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const ExperienceScreen());
    case AppRoute.educationScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const EducationScreen());
    case AppRoute.completeProfileScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const CompleteProfileScreen());

    default:
      return null;
  }
}
