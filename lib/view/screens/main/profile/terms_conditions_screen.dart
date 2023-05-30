import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_text.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.terms,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          preferredSize: Size.fromHeight(50)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 3.h,
            ),
            DefaultText(
              text: 'Lorem ipsum dolor',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 1.h,
            ),
            DefaultText(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
              maxLines: 15,
            ),
            SizedBox(
              height: 2.h,
            ),
            DefaultText(
              text: 'Lorem ipsum dolor',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 1.h,
            ),
            DefaultText(
              text:
              'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit.  ',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
              maxLines: 15,
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.grey.shade100,
              child: DefaultText(
                text:
                'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade500,
                maxLines: 15,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            DefaultText(
              text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
              maxLines: 15,
            ),
          ],
        ),
      ),
    );
  }
}
