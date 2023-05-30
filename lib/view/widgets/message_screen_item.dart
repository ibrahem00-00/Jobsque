
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/view/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_assets.dart';
import '../../view_model/main/chats/chats_cubit.dart';
import '../screens/main/chat_screen.dart';

class MessageScreenItem extends StatelessWidget {
  MessageScreenItem({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            context.read<ChatsCubit>().getAllMessages();
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
          },
          child: Container(
            child:Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(AppAssets.amitIcon),
                ),
                //Image.asset(AppAssets.amitIcon),
                SizedBox(width: 4.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(text:'AMIT',fontSize: 15.sp,fontWeight: FontWeight.w500,),
                  ]),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 1.h,),
        Divider(
          thickness: .25,
          color: Colors.black,
          indent: 10.w,
        ),
        SizedBox(height: 1.h,),
      ],
    );
  }
}
