import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lalit_practical/utils/constants.dart';

class CommonButton extends StatelessWidget {
  String? text;
  double? radius;
  Color? borderColor;
  Color? color;
  Color? textColor;
  VoidCallback? onPressed;
  double? borderWidth;
  double? fontSize;
  FontWeight? fontWeight;
  bool? load;
  double? height;
  String? prefixIcon;
  String? suffixIcon;
  Color? iconBorderColor;
  double? iconPadding;
  double? containerPadding;

  CommonButton(
      {super.key,
      this.text,
      this.radius,
      this.borderColor,
      this.color,
      this.onPressed,
      this.textColor,
      this.borderWidth,
      this.fontSize,
      this.fontWeight,
      this.load,
      this.height,
      this.prefixIcon,
      this.suffixIcon,
      this.iconBorderColor,
      this.containerPadding,
      this.iconPadding});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(containerPadding ?? 0),
        height: height ?? 52,
        decoration: BoxDecoration(
          color: color ?? AppColor.primary,
          borderRadius: BorderRadius.circular(radius ?? 10),
          border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            prefixIcon != null
                ? Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.all(iconPadding ?? 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                                color: iconBorderColor ?? Colors.transparent)),
                        child: SvgPicture.asset(height: 25, prefixIcon ?? "")),
                  )
                : const SizedBox(),
            Expanded(
              flex: 2,
              child: Center(
                child: load ?? false
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        text ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: textColor ?? Colors.white,
                          fontSize: fontSize ?? 16,
                          fontWeight: fontWeight ?? FontWeight.w500,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
