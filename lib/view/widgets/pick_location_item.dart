import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_colors.dart';
import '../../view_model/auth/signup/signup_cubit.dart';

// ignore: must_be_immutable
class PickLocationItem extends StatefulWidget {
  PickLocationItem({
    Key? key,
    required this.text,
    required this.img,
    required this.value,
    required this.remote,
  }) : super(key: key);

  String img;
  String text;
  String value;
  bool remote;

  @override
  State<PickLocationItem> createState() => _PickLocationItemState();
}

class _PickLocationItemState extends State<PickLocationItem> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
            widget.remote
                ? context.read<SignupCubit>().putInterestedWorkData(
                    remotePlace: widget.value, context: context)
                : context.read<SignupCubit>().putInterestedWorkData(
                    offlinePlace: widget.value, context: context);
            isClicked
                ? print(widget.value)
                : print('${widget.value} unselected');
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: isClicked ? AppColors.secondaryColor : Color(0xffF4F4F5),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                    color: isClicked
                        ? AppColors.primaryColor
                        : Colors.grey[200]!)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                    radius: 10, child: Image.asset(widget.img.toString())),
                SizedBox(
                  width: 2.w,
                ),
                Text(widget.text),
              ],
            ),
          ),
        );
      },
    );
  }
}
