import 'package:flutter/material.dart';
import 'package:lalit_practical/utils/constants.dart';

class CommonText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? underLine;

  const CommonText(
      {super.key,
      this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.underLine,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
        fontFamily: 'Inter',
        decoration: underLine ?? TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? 16,
        color: color ?? AppColor.black,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
