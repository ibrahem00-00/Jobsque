import 'package:flutter/material.dart';
import 'package:graduation/utilities/routes.dart';
import 'package:graduation/view/screens/auth/login_screen.dart';
import 'package:graduation/view/screens/main/apply_job/apply_job_screen.dart';
import 'package:graduation/view/screens/main/create_new_password.dart';
import 'package:graduation/view/screens/main/forget_password_screen.dart';
import 'package:graduation/view/screens/main/profile/personal_details_screen.dart';
import 'package:graduation/view/screens/main/search_screen.dart';
import 'package:graduation/view/screens/auth/setup_success.dart';
import 'package:graduation/view/screens/main/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../view/screens/auth/signup_interest.dart';
import '../view/screens/auth/signup_pick_location.dart';
import '../view/screens/auth/signup_screen.dart';
import '../view/screens/main/apply_job/apply_job_bio_data.dart';
import '../view/screens/main/apply_job/apply_job_data_submitted.dart';
import '../view/screens/main/check_your_email_screeen.dart';
import '../view/screens/main/home_layout.dart';
import '../view/screens/main/home_screen.dart';
import '../view/screens/main/on_board_screen.dart';
import '../view/screens/main/password _changed_succesfully.dart';
import '../view/screens/main/profile/change_assword_screen.dart';
import '../view/screens/main/profile/complete_portfolio_screen.dart';
import '../view/screens/main/profile/complete_profile_screen.dart';
import '../view/screens/main/profile/edit_email_address_screen.dart';
import '../view/screens/main/profile/edit_phone-number_screen.dart';
import '../view/screens/main/profile/edit_profile.dart';
import '../view/screens/main/profile/education_screen.dart';
import '../view/screens/main/profile/experience_Screen.dart';
import '../view/screens/main/profile/help_center_screen.dart';
import '../view/screens/main/profile/language_screen.dart';
import '../view/screens/main/profile/login_and_security_screen.dart';
import '../view/screens/main/profile/notification_screen.dart';
import '../view/screens/main/profile/portfolio_screen.dart';
import '../view/screens/main/profile/privacy_policy_screen.dart';
import '../view/screens/main/profile/terms_conditions_screen.dart';
import '../view/screens/main/profile/two_step_verification/two_step_verification_screen.dart';
import '../view/screens/main/profile/two_step_verification/two_step_verification_screen_2.dart';
import '../view/screens/main/profile/two_step_verification/two_step_verification_screen_3.dart';
import '../view/screens/main/profile/two_step_verification/two_step_verification_screen_4.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.registerScreenRoute:
      return MaterialPageRoute(builder:
          (context) => const SignupScreen(),
          settings: routeSettings
      );
    case AppRoutes.loginScreenRoute:

      return MaterialPageRoute(builder:
          (context) => const LoginScreen(),
        settings: routeSettings,

      );
    case AppRoutes.onBoardScreenRoute:

      return MaterialPageRoute(builder:
          (context) => const OnBoardScreen(),
        settings: routeSettings,

      );
    case AppRoutes.homeScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>  const HomeScreen(),
        settings: routeSettings,

      );
      case AppRoutes.signUpInterest:

      return MaterialPageRoute(builder:
          (context) =>  const SignUpInterest(),
        settings: routeSettings,

      );
      case AppRoutes.setupScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>  const SetUpSuccess(),
        settings: routeSettings,

      );
      case AppRoutes.forgetPasswordScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   ForgetPasswordScreen(),
        settings: routeSettings,

      );
      case AppRoutes.signUpPickLocationScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   SignUpPickLocationScreen(),
        settings: routeSettings,

      );
      case AppRoutes.checkYourEmailScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   CheckYourEmailScreen(),
        settings: routeSettings,

      );
      case AppRoutes.createNewPasswordScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   CreateNewPassword(),
        settings: routeSettings,

      );
      case AppRoutes.passwordChangedSuccessfullyScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   PasswordChangedSuccessfully(),
        settings: routeSettings,

      );
      case AppRoutes.homeLayoutScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   HomeLayout(),
        settings: routeSettings,

      );
      case AppRoutes.searchScreenRoute:
        return PageTransition(child: SearchScreen(), type: PageTransitionType.bottomToTop,duration: Duration(milliseconds: 100));

      // return MaterialPageRoute(builder:
      //     (context) =>   SearchScreen(),
      //   settings: routeSettings,
      //
      // );
    case AppRoutes.applyJobScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   ApplyJobScreen(jobId:1 ),
        settings: routeSettings,
      );
      case AppRoutes.ApplyJobBioDataScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   ApplyJobBioDataScreen(),
        settings: routeSettings,

      );
      case AppRoutes.ApplyJobDataSubmittedScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   ApplyJobDataSubmitted(),
        settings: routeSettings,

      );
      case AppRoutes.editProfileRouteScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   EditProfile(),
        settings: routeSettings,

      );
      case AppRoutes.portfolioScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   PortfolioScreen(),
        settings: routeSettings,

      );
      case AppRoutes.languageScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   LanguageScreen(),
        settings: routeSettings,

      );
      case AppRoutes.notificationScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   NotificationScreen(),
        settings: routeSettings,

      );
      case AppRoutes.loginAndSecurityScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   LoginAndSecurityScreen(),
        settings: routeSettings,

      );
      case AppRoutes.twoStepVerificationScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   TwoStepVerificationScreen(),
        settings: routeSettings,

      );
      case AppRoutes.changePasswordScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   ChangePasswordScreen(),
        settings: routeSettings,

      );
      case AppRoutes.editPhoneNumberScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   EditPhoneNumberScreen(),
        settings: routeSettings,

      );
      case AppRoutes.editEmailAddressScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   EditEmailAddressScreen(),
        settings: routeSettings,

      );
      case AppRoutes.twoStepVerificationScreen2Route:

      return MaterialPageRoute(builder:
          (context) =>   TwoStepVerificationScreen2(),
        settings: routeSettings,

      );
      case AppRoutes.twoStepVerificationScreen3Route:

      return MaterialPageRoute(builder:
          (context) =>   TwoStepVerificationScreen3(),
        settings: routeSettings,

      );
      case AppRoutes.twoStepVerificationScreen4Route:

      return MaterialPageRoute(builder:
          (context) =>   TwoStepVerificationScreen4(),
        settings: routeSettings,

      );
      case AppRoutes.helpCenterScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   HelpCenterScreen(),
        settings: routeSettings,

      );
      case AppRoutes.termsConditionsScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   TermsConditionsScreen(),
        settings: routeSettings,

      );
      case AppRoutes.privacyPolicyScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   PrivacyPolicyScreen(),
        settings: routeSettings,

      );
      case AppRoutes.completeProfileScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   CompleteProfileScreen(),
        settings: routeSettings,

      );
      case AppRoutes.personalDetailsScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   PersonalDetailsScreen(),
        settings: routeSettings,

      );
      case AppRoutes.educationScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   EducationScreen(),
        settings: routeSettings,

      );
      case AppRoutes.experienceScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   ExperienceScreen(),
        settings: routeSettings,

      );
      case AppRoutes.completePortfolioScreenRoute:

      return MaterialPageRoute(builder:
          (context) =>   CompletePortfolioScreen(),
        settings: routeSettings,

      );
    case AppRoutes.splashScreenRoute:
    default :
      return MaterialPageRoute(builder:
          (context) => const SplashScreen(),
          settings: routeSettings
      );

  }
}