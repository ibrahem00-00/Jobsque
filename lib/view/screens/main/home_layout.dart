import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilities/app_assets.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../view_model/main/apply_job/apply_job_cubit.dart';
import '../../../view_model/main/home/home_cubit.dart';
import '../../../view_model/main/home_layout/home_layout_cubit.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  void initState() {
    context.read<HomeCubit>().showSuggestedJobs();
    context.read<HomeCubit>().showJobs();
    context.read<ApplyJobCubit>().addToApplyScreen(context);
    context.read<HomeLayoutCubit>().currentIndex=0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit,HomeLayoutState >(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(

          body:context.read<HomeLayoutCubit>().screens[context.read<HomeLayoutCubit>().currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              context.read<HomeLayoutCubit>().changeIndex(index);
            },
            currentIndex: context.read<HomeLayoutCubit>().currentIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor:Colors.grey[300],
            items: [
              BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage(AppAssets.homeIcon)),label:AppStrings.home
              ),
              BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage(AppAssets.messageIcon)) ,label:AppStrings.messages
              ),
              BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage(AppAssets.briefcaseIcon)) ,label:AppStrings.applied
              ),
              BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage(AppAssets.archiveMinusIcon)) ,label:AppStrings.saved
              ),
              BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage(AppAssets.profileIcon)) ,label:AppStrings.profile
              ),
            ],
          ),
        );
      },
    );
  }

}


