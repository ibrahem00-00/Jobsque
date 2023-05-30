import 'package:flutter/material.dart';
import 'package:graduation/view/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

class ProfileColumn extends StatelessWidget {
   ProfileColumn({Key? key,required this.title,required this.number}) : super(key: key);

   String title;
   String number;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultText(text: title,fontSize: 15,color: Colors.grey.shade500,),
          SizedBox(height: 1.5.h,),
          DefaultText(text: number,fontSize: 20,),
        ],
      ),
    );
  }
}
