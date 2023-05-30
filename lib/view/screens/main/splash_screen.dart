import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graduation/utilities/routes.dart';

import '../../../utilities/app_assets.dart';
import '../../../view_model/database/local/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 4),
        () => Navigator.popAndPushNamed(
            context,
            CacheHelper.get(key: 'logged') == 'true'
                ? AppRoutes.homeLayoutScreenRoute
                : CacheHelper.get(key: 'onBoard') != 0
                    ? AppRoutes.onBoardScreenRoute
                    : AppRoutes.loginScreenRoute));
    // CacheHelper.get(key: 'logged') == 'true'
    //               ? AppRoutes.homeLayoutScreenRoute
    //               :
    //CacheHelper.get(key: 'onBoard') !=0? AppRoutes.onBoardScreenRoute:
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(AppAssets.blurIcon)),
            Image.asset(
              AppAssets.logo,
            )
          ],
        ),
      ),
    );
  }
}
