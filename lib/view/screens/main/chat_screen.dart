import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/model/chats_model/chats_model.dart';
import 'package:graduation/view/widgets/default_text_form_field.dart';
import 'package:graduation/view_model/main/chats/chats_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/app_assets.dart';
import '../../../utilities/app_colors.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ChatsCubit>().getAllMessages();
  }

  @override
  Widget build(BuildContext context) {
    var messageController = TextEditingController();
    return BlocConsumer<ChatsCubit, ChatsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Row(
              children: [
                Text(
                  'AMIT',
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            actions: [
              ImageIcon(
                AssetImage(AppAssets.moreIcon),
                color: Colors.black,
              ),
              SizedBox(
                width: 3.w,
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                    reverse: true,
                    itemCount: ChatsModel.dataList.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          child: ChatsModel.dataList.isEmpty
                              ? const Center(
                                  child: Text(
                                    "THere Is no Chat ",
                                    style: TextStyle(color: Colors.black, fontSize: 50),
                                  ),
                                )
                              : ChatsModel.dataList[index].sender_user.toString() ==
                                      "user"
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(vertical: 2.h),
                                          padding: EdgeInsets.all(2.8.w),
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5.sp),
                                              bottomRight: Radius.circular(5.sp),
                                              bottomLeft: Radius.circular(5.sp),
                                            ),
                                          ),
                                          child: Text(
                                            ChatsModel.dataList[index].massage
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 12.sp, color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(vertical: 2.h),
                                          padding: EdgeInsets.all(2.8.w),
                                          decoration: BoxDecoration(
                                            color: const Color(0xffE5E7EB),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5.sp),
                                              bottomRight: Radius.circular(5.sp),
                                              bottomLeft: Radius.circular(5.sp),
                                            ),
                                          ),
                                          child: Text(
                                            ChatsModel.dataList[index].massage
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 12.sp, color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        )
                                      ],
                                    ));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xffD1D5DB),
                        radius: 6.5.w,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 6.w,
                          child: ImageIcon(
                            AssetImage(AppAssets.paperclipIcon),
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1.5.w,
                      ),
                      Expanded(
                          child: DefaultFormField(
                            controller: messageController,
                            maxLines: 1,
                            onFieldSubmitted: (String value) {},
                            radius: 50,
                            onChanged: (value) {
                              //context.read<ChatsCubit>().changIcon(value);
                            },
                            onEditingComplete: () {
                              context.read<ChatsCubit>().userSentMessage(
                                message: messageController.text,
                              );
                              messageController.text = "";
                            },
                            hintText: "Write Message...",
                            keyboardType: TextInputType.text,
                          )),
                      SizedBox(
                        width: 1.5.w,
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xffD1D5DB),
                        radius: 6.5.w,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 6.w,
                          child: InkWell(
                              onTap: () {
                                context.read<ChatsCubit>().userSentMessage(
                                  message: messageController.text,
                                );
                                messageController.text = "";
                              },
                              child:Image.asset(AppAssets.microphoneIcon,width: 25,height: 25,),
                        ),
                      ),
                      )],
                  ),
                )
              ],
            ),
          ),

        );
      },
    );
  }
}
