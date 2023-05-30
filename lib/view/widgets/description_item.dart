import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_strings.dart';
import 'default_text.dart';


class DescriptionItem extends StatelessWidget {
   DescriptionItem({Key? key,required this.description,required this.skill}) : super(key: key);

  String description;
  String skill;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          text: AppStrings.jobDescription,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 1.5.h,),
        DefaultText(
          text:
          'Your role as the UI Designer is to use interactive components on various platforms (web, desktop and mobile). This will include producing high-fidelity mock-ups, iconography, UI illustrations/graphics, and other graphic elements. As the UI Designer, you will be supporting the wider design team with the internal Design System, tying together the visual language. You will with other UI and UX Designers, Product Managers, and Engineering teams in a highly customer-focused agile environment to help define the vision of the products.',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          maxLines: 20,
        ),
        SizedBox(height: 2.h,),
        DefaultText(
          text: AppStrings.skillRequired,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 1.5.h,),
        DefaultText(
          text:
          'A strong visual portfolio with clear understanding of UI methodologies\nAbility to create hi-fidelity mock-ups in Figma\nAbility to create various graphics for the web e.g. illustrations and icons\nAble to facilitate workshops and liaise with stakeholders\nProficiency in the Adobe Creative Suite\nConfident communicator with an analytical mindset\nDesign library/Design system experience\n4+ years of commercial experience in UI/Visual Design',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          maxLines: 30,
        ),
      ],
    );
  }
}
