import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/utilities/router.dart';
import 'package:graduation/utilities/routes.dart';
import 'package:graduation/view_model/auth/login/login_cubit.dart';
import 'package:graduation/view_model/auth/signup/signup_cubit.dart';
import 'package:graduation/view_model/database/local/cache_helper.dart';
import 'package:graduation/view_model/database/remote/dio_helper.dart';
import 'package:graduation/view_model/main/apply_job/apply_job_cubit.dart';
import 'package:graduation/view_model/main/chats/chats_cubit.dart';
import 'package:graduation/view_model/main/complete_profile/complete_profile_cubit.dart';
import 'package:graduation/view_model/main/home/home_cubit.dart';
import 'package:graduation/view_model/main/home_layout/home_layout_cubit.dart';
import 'package:graduation/view_model/main/onboard/onboard_cubit.dart';
import 'package:graduation/view_model/main/profile/profile_cubit.dart';
import 'package:graduation/view_model/main/reset_password/reset_password_cubit.dart';
import 'package:graduation/view_model/main/saved/saved_cubit.dart';
import 'package:graduation/view_model/main/search/search_cubit.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  DioHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return  Sizer(
      builder: (context, orientation, deviceType) {
        return  MultiProvider(
            providers: [
              BlocProvider(create: (context) => LoginCubit(),),
              BlocProvider(create: (context) => SignupCubit(),),
              BlocProvider(create: (context) => OnboardCubit(),),
              BlocProvider(create: (context) => ResetPasswordCubit(),),
              BlocProvider(create: (context) => HomeLayoutCubit(),),
              BlocProvider(create: (context) => ApplyJobCubit(),),
              BlocProvider(create: (context) => HomeCubit(),),
              BlocProvider(create: (context) => SearchCubit(),),
              BlocProvider(create: (context) => SavedCubit()..showSavedJobs(),),
              BlocProvider(create: (context) => ProfileCubit(),),
              BlocProvider(create: (context) => CompleteProfileCubit(),),
              BlocProvider(create: (context) => ChatsCubit(),),

            ],
          child: MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                    elevation: 0,
              ),
                  scaffoldBackgroundColor: Colors.white,

                bottomSheetTheme:BottomSheetThemeData(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  modalBarrierColor: Colors.transparent,
                ) ,
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerate,
            initialRoute: AppRoutes.splashScreenRoute,
          ),
        );
      },
    );
  }
}

