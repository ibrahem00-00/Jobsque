import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_strings.dart';
import 'default_text.dart';

class GridItem extends StatelessWidget {
  const GridItem({Key? key, required this.img, required this.des, required this.onTap}) : super(key: key);

  final String img;
  final String des;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        //alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.primaryColor,width: 1.5),
            color: AppColors.secondaryColor),
        child: Padding(
          padding: const EdgeInsets.only(left: 16,top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:const [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                backgroundImage:  AssetImage('assets/profile.png'),
              ),
              DefaultText(text: AppStrings.uIUXDesigner)
            ],
          ),
        ),
      ),
    );
  }
}
