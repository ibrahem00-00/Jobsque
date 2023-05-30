import 'package:flutter/material.dart';
import 'package:graduation/view_model/database/local/cache_helper.dart';

import '../../utilities/app_strings.dart';
import 'default_text.dart';
class LoginAndSecurityScreenItem extends StatelessWidget {
   LoginAndSecurityScreenItem({Key? key,required this.txt,required this.route,required this.index,}) : super(key: key);
String txt;
String route;
int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultText(text: txt,fontSize: 16,fontWeight: FontWeight.w400,),
        Row(
          children: [
            DefaultText(text:index ==0? CacheHelper.get(key: 'email'): index ==3?AppStrings.emailAddress :'',fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey.shade500,),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, route);
            },icon: Icon(Icons.arrow_forward)),
          ],
        )
      ],
    );
  }
}
