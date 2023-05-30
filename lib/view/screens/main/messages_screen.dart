import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../view_model/main/home_layout/home_layout_cubit.dart';
import '../../widgets/default_app_bar.dart';
import '../../widgets/default_text.dart';
import '../../widgets/message_screen_item.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(onPressed: (){
              context.read<HomeLayoutCubit>().changeIndex(0);
            },color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.messages,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          preferredSize: Size.fromHeight(50)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              MessageScreenItem()
            ],
          ),
        ),
      ),
    );
  }
}
