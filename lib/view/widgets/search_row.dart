import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:graduation/view/widgets/default_text.dart';


// ignore: must_be_immutable
class SearchRow extends StatefulWidget {
   SearchRow
       ({
     Key? key,
     required this.prefixIcon,
     required this.title,
     required this.suffixIcon,
     required this.suffixColor
   }) : super(key: key);

   String prefixIcon;
   String title;
   String suffixIcon;
   Color  suffixColor;

  @override
  State<SearchRow> createState() => _SearchRowState();
}

class _SearchRowState extends State<SearchRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ImageIcon(AssetImage(widget.suffixIcon),),
          SizedBox(width: 2.w,),
          Expanded(child: DefaultText(text: widget.title, fontSize: 14)),
          ImageIcon(AssetImage(widget.suffixIcon),color:widget.suffixColor ,)
        ],
      ),
    );
  }
}
