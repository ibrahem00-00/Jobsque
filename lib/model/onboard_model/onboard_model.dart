
import 'package:flutter/material.dart';

class OnboardModel {
  String img;
  String text;
  String? text1;
  String blueText;
  String desc;
  Color button;

  OnboardModel({
    required this.img,
    required this.text,
    this.text1,
    required this.blueText,
    required this.desc,
    required this.button,
  });
}
