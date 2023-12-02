import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lalit_practical/controller/time_controller.dart';
import 'package:lalit_practical/utils/constants.dart';

class CommonTextField extends StatelessWidget {
  double? fontSize;
  FontWeight? fontWeight;
  Color? fillColor;
  Color? borderColor;
  Color? enableBorderColor;
  Color? color;
  double? radius;
  TextEditingController? controller;

  CommonTextField({
    super.key,
    this.fontSize,
    this.fontWeight,
    this.fillColor,
    this.borderColor,
    this.radius,
    this.color,
    this.controller,
    this.enableBorderColor,
  });

  @override
  final timeCon = Get.find<TimeController>();

  Widget build(BuildContext context) {
    return SizedBox(
      width: 78,
      height: 84,
      child: Obx(() =>
         TextField(
          controller: controller,
          showCursor: false,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          autofocus: true,
          maxLength: 2,
          onChanged: (value) {
            if (value.isNotEmpty && value.length == 2) {
              timeCon.timeError.value = false;
              FocusScope.of(context).nextFocus();
            }
          },
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: fontWeight ?? FontWeight.w600,
            fontSize: fontSize ?? 25,
            color: color ?? AppColor.black,
          ),
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: fillColor ?? AppColor.backgroundColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 10),
              borderSide: BorderSide(color: borderColor ?? AppColor.black),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 10),
              borderSide: const BorderSide(color: AppColor.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 10),
              borderSide: const BorderSide(color: AppColor.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 10),
              borderSide: BorderSide(
                  color: timeCon.timeError.value?AppColor.red:AppColor.backgroundColor),
            ),
          ),
        ),
      ),
    );
  }
}
